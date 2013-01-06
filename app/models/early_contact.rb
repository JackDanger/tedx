class EarlyContact < ActiveRecord::Base

  attr_accessible :name, :email, :can_sponsor

  validates :email, :presence => true

  after_save :deliver_email

  private

  def deliver_email
    Mail::Message.new(subject: can_sponsor? ?
                                "TEDx sponsorship lead" :
                                "TEDx pre-register",
                      body:    can_sponsor? ?
                                 "#{name} #{email} might want to be a sponsor" :
                                 "Just signed up: #{name} #{email}",
                      from:    "TEDx Website <noreply@tedxfidiwomen.com>",
                      sender:  "noreply@tedxfidiwomen.com",
                      to:      ENV['contact_emails'].split(',')).deliver
  end
end
