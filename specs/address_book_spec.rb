require 'address_book'

RSpec.describe AddressBook do
  book = AddressBook.new()
  context "testing adding an entry" do
    it "tests adding an entry to the AddressBook class" do
      name = 'Winston Smith'
      phone_number = '999.999.9999'
      email = 'winston@winston.com'
      book.add_entry(name, phone_number, email)
      book_size = book.entries.size
      expect $book_size == 1

      entry = book.entries.at(0)
      expect entry.name.eql? name
      expect entry.phone_number.eql? phone_number
      expect entry.email.eql? email
    end
  end

  context "testing add_from_csv" do
    it "tests the csv import process" do
      book.add_from_csv("entries.csv")
      book_size = book.entries.size
      expect $book_size == 5

      entry = book.entries.first()
      expect entry.name.eql? "Joe"
      expect entry.phone_number.eql? "291-291-9291"
      expect entry.email.eql? "joe@blocmail.com"

      entry = book.entries[1]
      expect entry.name.eql? "Sally"
      expect entry.phone_number.eql? "492-299-1931"
      expect entry.email.eql? "sally@blocmail.com"

      entry = book.entries[2]
      expect entry.name.eql? "Bob"
      expect entry.phone_number.eql? "839-822-7831"
      expect entry.email.eql? "bob@blocmail.com"

      entry = book.entries[3]
      expect entry.name.eql? "Bill"
      expect entry.phone_number.eql? "783-134-9771"
      expect entry.email.eql? "bill@blocmail.com"

      entry = book.entries[4]
      expect entry.name.eql? "Sussie"
      expect entry.phone_number.eql? "831-883-1099"
      expect entry.email.eql? "sussie@blocmail.com"

    end
  end

  context "testing binary_search" do
    it "tests the binary_search method" do
      entry = book.binary_search("Bob")
      expect entry.name.eql? "Rob Madden"
      expect entry.phone_number.eql? "630.768.6995"
      expect entry.email.eql? "madden.rob@gmail.com"
    end
  end

end
