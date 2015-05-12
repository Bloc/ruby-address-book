# This class acts as the controller for menu. It will
# take input from the user and will figure out what to 
# spit out on the command line.
#
# Author::    This is you.
# Copyright:: Copyright (c) 2015 by you.
# License::   Distributes under the same terms as Ruby

require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  # This is defactor initializer
  def initialize
    @address_book = AddressBook.new
  end

  # This is a simple helper function to display the menu
  def print_main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "
  end

  # This is called by the run method directly
  def parse_input(selection)
    case selection
    when 1
      view_all_entries
      run
    when 2
      create_entry
      run
    when 3
      system "clear"
      search_entries
      run
    when 4
      read_csv
      run
    when 5
      puts "Good-bye!"
      exit(0)
      run
    else
      puts "#{selection} is not a valid input"
      run
    end
  end

  # Called after the user inputs a selection
  def run
    print_main_menu
    selection = $stdin.gets.chomp.to_i
    parse_input(selection)
  end

  # Helper method to simply print the submenu
  def print_entries_submenu
    puts "\nn - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
  end

  # Helper method to parse the input for the submenu
  def parse_submenu_input(selection, entry)
    case selection
    when "n"
    when "d"
      delete_entry(entry)
    when "e"
      edit_entry(entry)
      display_entries_submenu(entry)
    when "m"
      system "clear"
      run
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts entry.to_s
      display_entries_submenu(entry)
    end
  end

  # Wrapper function to handle all sub-menu related stuff
  def display_entries_submenu(entry)
    print_entries_submenu
    selection = $stdin.gets.chomp
    parse_submenu_input(selection, entry)
  end

  # Print out the menu which display after option 3 (search for entry) is called
  def print_search_submenu
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
  end

  # Prints the search sub menu options and then parses the input from the user
  def display_search_submenu(entry)
    print_search_submenu

    selection = $stdin.gets.chomp
    case selection
    when "d"
      system "clear"
      delete_entry(entry)
      run
    when "e"
      edit_entry(entry)
      system "clear"
      puts "Updated Entry"
      run
    when "m"
      system "clear"
      run
    else
      system "clear"
      puts "#{selection} is not a valid input for the submenu"
      puts entry.to_s
      display_search_submenu(entry)
    end
  end

  # Dump the contents of the AddressBook to 
  def view_all_entries
    system "clear"

    @address_book.entries.each_with_index do |entry, index|
      system "clear"
      puts "Entry #{index + 1}"
      puts entry.to_s
      display_entries_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  # Get which fields to update from the user and edit an Entry in the Address Book
  def edit_entry(entry)
    print "Updated name: "
    name = $stdin.gets.chomp
    print "Updated phone number: "
    phone_number = $stdin.gets.chomp
    print "Updated email: "
    email = $stdin.gets.chomp

    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?

    puts "Updated entry:"
    puts entry
  end

  # Delete an entry from the address book
  def delete_entry(entry)
    @address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  # Create a new entry and add it to the Address Book
  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = $stdin.gets.chomp
    print "Phone number: "
    phone = $stdin.gets.chomp
    print "Email: "
    email = $stdin.gets.chomp

    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  # Search the address book for a specific name
  def find_match(name) 
    @address_book.search(name)
  end

  # The Address book by first name
  def search_entries
    print "Search by name: "
    name = $stdin.gets.chomp
    match = find_match(name)

    if match
      $stdout.print match.to_s 
      display_search_submenu(match)
    else
      $stdout.print "No match found for "
    end
  end

  # Read a CSV file in by name
  def read_csv
    $stdout.print "Enter CSV file to import: "
    file_name = $stdin.gets.chomp

    if file_name.empty?
      system "clear"
      $stdout.print "No CSV file read"
      run
    end

    begin
      @address_book.add_from_csv(file_name)
    rescue
      $stdout.print "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
  end
end
