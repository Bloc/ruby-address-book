# This class holds the Address Book data model which consists of a
# running list of entries.
#
# Author::    This is you.
# Copyright:: Copyright (c) 2015 by you.
# License::   Distributes under the same terms as Ruby.

require 'csv'  
require_relative "entry"

class AddressBook
  attr_accessor :entries

  # This is the de-factor initializer 
  def initialize
    @entries = []
  end

  # Add an entry to the Address Book (running list of entries)
  def add_entry(name, phone, email)
    @entries << Entry.new(name, phone, email)
  end

  # Pull data in from a CSV (comma separated values) file
  def add_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true)
    new_entries = csv.count
    csv.each do |row|
      row_hash = row.to_hash
      @entries << Entry.new(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end

    system "clear"
    puts "#{new_entries} new entries added from #{file_name}"
  end

  # Searches the Address Book for a specific entry
  def binary_search(name)
    puts name
    lower = 0
    upper = entries.length - 1

    while upper >= lower
      mid = (upper + lower) / 2
      mid_value = entries[mid].name
      val = name <=> mid_value

      if val < 0
        lower = mid + 1
      elsif val > 0
        upper = mid - 1
      else
        return entries[mid]
      end
    end

    return nil
  end

  # Wraps the binary_search method 
  def search(name)
    # Maybe we have more than one implementation of search? 
    return binary_search(name)
  end
  
end
