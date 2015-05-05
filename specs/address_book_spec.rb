require 'address_book'

RSpec.describe AddressBook, "add_entry" do
  book = AddressBook.new()
  context "Testing adding an entry" do
    it "Tests adding an entry to the AddressBook class" do
      name = 'Rob Madden'
      phone_number = '630.768.6995'
      email = 'madden.rob@gmail.com'
      book.add_entry(name, phone_number, email)
      bookSize = book.entries.size
      expect $bookSize == 1

      entry = book.entries.at(0)
      expect entry.name.eql? name
      expect entry.phone_number.eql? phone_number
      expect entry.email.eql? email
    end
  end

  context "Testing add_from_csv" do
    it "Tests the csv import process" do
      book.add_from_csv("entries.csv")
      bookSize = book.entries.size
      expect $bookSize == 5

      entry = book.entries.at(0)
      expect entry.name.eql? "Joe"
      expect entry.phone_number.eql? "291-291-9291"
      expect entry.email.eql? "joe@blocmail.com

      entry = book.entries.at(1)
      expect entry.name.eql? "Sally"
      expect entry.phone_number.eql? "492-299-1931"
      expect entry.email.eql? "sally@blocmail.com"

      entry = book.entries.at(2)
      expect entry.name.eql? "Bob"
      expect entry.phone_number.eql? "839-822-7831"
      expect entry.email.eql? "bob@blocmail.com"

      entry = book.entries.at(3)
      expect entry.name.eql? "Bill"
      expect entry.phone_number.eql? "783-134-9771"
      expect entry.email.eql? "bill@blocmail.com"

      entry = book.entries.at(4)
      expect entry.name.eql? "Sussie"
      expect entry.phone_number.eql? "831-883-1099"
      expect entry.email.eql? "sussie@blocmail.com"

    end
  end
end
