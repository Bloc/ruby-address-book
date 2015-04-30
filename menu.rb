class Menu

  def run
    puts "\nWelcome to AddressBloc!"
    puts "1 - View all entries"
    puts "2 - View an entry"
    puts "3 - Edit an entry"
    puts "4 - Delete an entry"
    puts "5 - Create an entry"
    puts "6 - Search for an entry"
    puts "7 - Read a CSV"
    puts "8 - Exit"
    print "Enter your selection: "

    selection = $stdin.gets.chomp.to_i

    case selection
    when 1
      puts "You picked #{selection}"
      view_all_entries
      run
    when 2
      puts "You picked #{selection}"
      view_entry
      run
    when 3
      puts "You picked #{selection}"
      edit_entry
      run
    when 4
      puts "You picked #{selection}"
      delete_entry
      run
    when 5
      puts "You picked #{selection}"
      create_entry
      run
    when 6
      puts "You picked #{selection}"
      search_entries
      run
    when 7
      puts "You picked #{selection}"
      read_csv
      run
    when 8
      puts "Good-bye!"
      exit(0)
      run
    else
      puts "#{selection} is not a valid selection."
      run
    end
  end

  def view_all_entries
  end

  def view_entry
  end

  def edit_entry
  end

  def delete_entry
  end

  def create_entry
  end

  def search_entries
  end

  def read_csv
  end
end
