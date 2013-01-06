class EarlyContact < ActiveRecord::Base

  attr_accessible :name, :email, :can_sponsor

  validates :email, :presence => true

  after_save :deliver_email

  private

  def deliver_email
    Mail::Message.new(subject: "TEDx pre-register",
                      body:    "Just signed up: #{name} #{email}",
                      sender:  "noreply@tedxfidiwomen.com",
                      to:      ENV['contact_emails'].split(',')).deliver
  end
end
