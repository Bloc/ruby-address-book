require_relative "address_book"

class Menu
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def run
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Read a CSV"
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
      puts "You picked #{selection}"
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
      puts "#{selection} is not a valid selection."
      run
    end
  end

  def entries_submenu(entry)
    puts "\nEntry Submenu"
    puts "n - next entry"
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
      puts "#{selection} is not a valid selection."
      entries_submenu
    end
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      puts entry.to_s
      entries_submenu(entry)
    end

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
    puts "New AddressBloc Entry"
    print "Name: "
    name = $stdin.gets.chomp
    print "Phone number: "
    phone = $stdin.gets.chomp
    print "Email: "
    email = $stdin.gets.chomp

    @address_book.add_entry(name, phone, email)

    puts "New entry created"
  end

  def search_entries
    print "Search for Name: "
    name = $stdin.gets.chomp
    match = @address_book.search(name)
    if match
	puts match.to_s 
	puts
    end
  end

  def read_csv
    print "Enter csv to import: "
    file_name = $stdin.gets.chomp

    @address_book.add_from_csv(file_name)
  end
end
