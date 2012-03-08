if Rails.env.production?
  Airbrake.configure do |config|
    config.api_key = ENV["AIRBRAKE_KEY"]
  end
end
