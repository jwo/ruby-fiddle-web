class RiddlesController < ApplicationController
  respond_to :html, :js
  rescue_from ActionController::RoutingError, :with => :not_found

  def index
    @riddle = Riddle.new
  end

  def create
    @riddle = Riddle.create(params[:riddle].slice(:code))
    respond_with @riddle, :notice=>"Riddle created"
  end

  def update
    @riddle = Riddle.for_token(params[:id])
    @riddle.update_attributes(params[:riddle].slice(:code))
    respond_with @riddle, :notice=>"Riddle updated"
  end

  def fork
    @riddle = Riddle.for_token(params[:id]).fork!
    respond_with @riddle, :notice=>"Riddle forked!"
  end

  def show
    @riddle = get_version_of_riddle(Riddle.for_token(params[:id]), params.fetch(:version, 1))
    if @riddle.nil?
      not_found
    else
      render :index
    end
  end
  
  def gistify
    gist = ActiveGist.new(:public => true, :description => "testing activegist", :files => {'foo.rb' =>{:content => params[:gist_content] }})
    
    if gist.save
      render :json => {:gist_url => gist.html_url}, :status => :ok
    else
      render :json => {:error => "Unable to create"}, :status => :error
    end  
  end

  def not_found
    render :file => "#{Rails.root}/public/404.html", :status => :not_found 
  end

  def get_version_of_riddle(riddle, version)
    version = Integer(version)
    available_count = riddle.versions.length

    if available_count > version
      Maybe(riddle.versions[version]).reify
    elsif version > available_count
      raise ActionController::RoutingError.new('Not Found')
    else
      riddle
    end
  end
end
