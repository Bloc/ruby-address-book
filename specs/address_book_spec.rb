require_relative "../models/address_book"

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }

  describe ".add_entry:" do
    it "adds an entry to the AddressBook class" do
      name = 'Winston Smith'
      phone_number = '999.999.9999'
      email = 'winston@winston.com'
      book.add_entry(name, phone_number, email)
      book_size = book.entries.size
      entry = book.entries.at(0)

      expect(book_size).to eql(1)
      expect entry.name.eql? name
      expect entry.phone_number.eql? phone_number
      expect entry.email.eql? email
    end
  end

  describe ".add_from_csv:" do
    it "tests the csv import process" do
      book.add_from_csv("entries.csv")
      book_size = book.entries.size

      # Check the size of the Address Book
      expect(book_size).to eql(5)

      # Check the first entry
      entry = book.entries.first()
      expect entry.name.eql? "Joe"
      expect entry.phone_number.eql? "291-291-9291"
      expect entry.email.eql? "joe@blocmail.com"

      # Check the second entry
      entry = book.entries[1]
      expect entry.name.eql? "Sally"
      expect entry.phone_number.eql? "492-299-1931"
      expect entry.email.eql? "sally@blocmail.com"

      # Check the third entry
      entry = book.entries[2]
      expect entry.name.eql? "Bob"
      expect entry.phone_number.eql? "839-822-7831"
      expect entry.email.eql? "bob@blocmail.com"

      # Check the fourth entry
      entry = book.entries[3]
      expect entry.name.eql? "Bill"
      expect entry.phone_number.eql? "783-134-9771"
      expect entry.email.eql? "bill@blocmail.com"

      # Check the fifth entry
      entry = book.entries[4]
      expect entry.name.eql? "Sussie"
      expect entry.phone_number.eql? "831-883-1099"
      expect entry.email.eql? "sussie@blocmail.com"
    end
  end

  describe ".binary_search:" do
    it "searches AddressBook for existent entry" do
      book.add_from_csv("entries.csv")
      entry = book.binary_search("Bob")
      expect(entry.instance_of?(Entry))
      expect entry.name.eql? "Bob"
      expect entry.phone_number.eql? "839-822-7831"
      expect entry.email.eql? "bob@blocmail.com"
    end

    it "searches AddressBook for non-existent entry" do
      book.add_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end
  end
end # End RSpec.describe
