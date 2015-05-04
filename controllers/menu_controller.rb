require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def run
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "

    selection = $stdin.gets.chomp.to_i

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

  def entries_submenu(entry)
    puts "\nn - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = $stdin.gets.chomp

    case selection
    when "n"
    when "d"
      delete_entry(entry)
    when "e"
      edit_entry(entry)
      entries_submenu(entry)
    when "m"
      system "clear"
      run
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts entry.to_s
      entries_submenu(entry)
    end
  end

  def search_submenu(entry)
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

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
      puts "#{selection} is not a valid input"
      puts entry.to_s
      search_submenu(entry)
    end
  end

  def view_all_entries
    system "clear"

    @address_book.entries.each_with_index do |entry, index|
      system "clear"
      puts "Entry #{index + 1}"
      puts entry.to_s
      entries_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

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

  def delete_entry(entry)
    @address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

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

  def search_entries
    print "Search by name: "
    name = $stdin.gets.chomp
    match = @address_book.search(name)
    if match
    	puts match.to_s 
      search_submenu(match)
    else
      puts "No match found for "
    end
  end

  def read_csv
    print "Enter CSV file to import: "
    file_name = $stdin.gets.chomp

    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      run
    end

    begin
      @address_book.add_from_csv(file_name)
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
  end
end
