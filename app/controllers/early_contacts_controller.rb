class EarlyContactsController < ApplicationController

  before_filter :find_or_initialize

  def create
    record.save!
  end

  protected

  def find_or_initialize
    @record ||= EarlyContact.new params[:early_contact]
  end

  def record
    @record
  end

  helper_method :record
end
