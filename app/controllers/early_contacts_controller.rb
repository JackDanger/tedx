class EarlyContactsController < ApplicationController

  before_filter :find_or_initialize

  def create
    record.save!
    render json: json
  rescue ActiveRecord::RecordInvalid => e
    render json: json
  end

  protected

  def json
    {:errors => record.errors.full_messages,
     :persisted => !record.new_record?}
  end

  def find_or_initialize
    @record ||= EarlyContact.new params[:early_contact]
  end

  def record
    @record
  end

  helper_method :record
end
