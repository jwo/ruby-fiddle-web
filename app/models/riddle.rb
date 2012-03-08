class Riddle < ActiveRecord::Base
  has_paper_trail
  validates_presence_of :code
  belongs_to :riddle, :foreign_key => :forked_from_id

  def fork!
    Riddle.create!({code: code, forked_from_id: self.id})
  end

end
