require_relative "../models/address_book"

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }

  describe ".add_entry" do
    context "when adding an address" do
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
  end

  context "when importing the addresses from a csv" do
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

    context ".binary_search" do
      #it "expect(AddressBook.binary_search.to return(1).item " do
      it "should return Bob" do
        book.add_from_csv("entries.csv")
        entry = book.binary_search("Bob")
        expect entry.name.eql? "Bob"
        expect entry.phone_number.eql? "839-822-7831"
        expect entry.email.eql? "bob@blocmail.com"
      end
    end
  end
end
