class EarlyContact < ActiveRecord::Base

  validates :email, :presence => true
end
