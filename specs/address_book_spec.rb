require 'address_book'

RSpec.describe AddressBook, "add_entry" do
  context "Testing adding an entry" do
    it "Tests adding an entry to the AddressBook class" do
      book = AddressBook.new()
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
end
