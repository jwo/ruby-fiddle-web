class Riddle < ActiveRecord::Base
  has_paper_trail
  validates_presence_of :code
end
