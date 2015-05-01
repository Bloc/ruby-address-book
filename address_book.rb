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

  def binary_search(name)
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

  def search(name)
    # Maybe we have more than one implementation of search? 
    return binary_search(name)
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
