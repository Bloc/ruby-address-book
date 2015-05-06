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

  context ".read_csv():" do
    it "reads the filename from STDIN and parses it, expects a CSV" do
      mock_stdin "entries.csv" do
        controller.read_csv()

        # We're only going to check the number of items that read_csv() parsed
        # as well as details of the first and last entry. We are assuming that
        # it parsed the middle entries correctly. This is the lazy way to do it.
        # We should probably check every entry and verify that parsing was proper
        # albeit that particular test may not be within scope of this test.

        # Check the number of enties
        expect controller.address_book.entries.count == 5
        
        # Check the first entry
        first_entry = controller.address_book.entries.first()
        expect first_entry.name == "Joe"
        expect first_entry.phone_number = "291-291-9291"
        expect first_entry.email = "joe@blocmail.com"

        # Check the last entry
        last_entry = controller.address_book.entries.last()
        expect last_entry.name == "Sussie"
        expect last_entry.phone_number = "831.883-1099"
        expect last_entry.email = "sussie@blocmail.com"

      end
    end
  end

  context ".search_entries()" do
    it "searches the address book by name" do
    end
  end
 
end
