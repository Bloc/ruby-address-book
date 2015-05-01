require 'csv'  
require_relative "entry"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone, email)
    @entries << Entry.new(name, phone, email)
  end

  def search(name)

  end

  def add_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true)
    new_entries = csv.count
    csv.each do |row|
      row_hash = row.to_hash
      @entries << Entry.new(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end

    puts "#{new_entries} new entries added"
  end
end