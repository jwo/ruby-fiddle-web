class Riddle < ActiveRecord::Base
  has_paper_trail
  HasTokens.on self
  
  has_tokens :public=>5
  validates_presence_of :code
  belongs_to :riddle, :foreign_key => :forked_from_id

  before_validation :generate_tokens, on: :create

  def self.for_token(token)
    find_by_public_token!(token)
  end

  def fork!
    Riddle.create!({code: code, forked_from_id: self.id})
  end

  def to_param
    public_token
  end

end
