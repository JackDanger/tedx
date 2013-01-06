class EarlyContact < ActiveRecord::Base

  attr_accessible :name, :email, :can_sponsor

  validates :email, :presence => true
end
