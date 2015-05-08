require_relative "../controllers/menu_controller"
require 'stringio'
require "spec_helper"

RSpec.describe MenuController do
  controller = MenuController.new()

  def mock_stdin(user_input)
    stdin = $stdin
    $stdin = mock = StringIO.new user_input
    yield
    mock.read
    ensure
    $stdin = stdin
  end

  context ".read_csv:" do
    it "reads the filename from STDIN and parses it, expects a CSV" do
      mock_stdin "entries.csv" do
        controller.read_csv

        # We're only going to check the number of items that read_csv parsed
        # as well as details of the first and last entry. We are assuming that
        # it parsed the middle entries correctly. This is the lazy way to do it.
        # We should probably check every entry and verify that parsing was proper
        # albeit that particular test may not be within scope of this test.

        # Check the number of enties
        expect controller.address_book.entries.count == 5
        
        # Check the first entry
        first_entry = controller.address_book.entries.first
        expect first_entry.name.eql? "Joe"
        expect first_entry.phone_number.eql? "291-291-9291"
        expect first_entry.email.eql? "joe@blocmail.com"

        # Check the last entry
        last_entry = controller.address_book.entries.last
        expect last_entry.name.eql? "Sussie"
        expect last_entry.phone_number.eql? "831.883-1099"
        expect last_entry.email.eql? "sussie@blocmail.com"
      end
    end
  end

  context ".find_match" do
    it "searches the address book for a match" do
      mock_stdin "entries.csv" do
        controller.read_csv
        match = controller.find_match("Sussie")
        expect match.name.eql? "Sussie"
        expect match.phone_number.eql? "831.883-1099"
        expect match.email.eql? "sussie@blocmail.com"

        match = controller.find_match("Fake User")
        expect match.eql? nil
      end
    end
  end

end # End RSpec.describe
