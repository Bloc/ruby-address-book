require_relative "controllers/menu_controller"

menu = MenuController.new
system "clear"
puts "\nWelcome to AddressBloc!"
menu.run