#!/usr/bin/env ruby
require File.expand_path("../../config/environment", __FILE__)
require 'csv'

[2011, 2012].each do |year|
  CSV.read(
    Rails.root.join("db/#{year}.csv"),
    headers: true
  ).each do |row|
    record = Attendee.create! row.to_hash.merge(year: year)
    puts "#{year}: #{record.first} #{record.last}"
  end
end


