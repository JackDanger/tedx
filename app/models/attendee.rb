class Attendee < ActiveRecord::Base
  attr_accessible :email, :first, :last, :order, :year
end
