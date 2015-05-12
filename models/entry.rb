# This class holds the model for an actual entry in the Address Book
#
# Author::    This is you.
# Copyright:: Copyright (c) 2015 by you.
# License::   Distributes under the same terms as Ruby.

class Entry
  attr_accessor :name, :phone_number, :email

  def initialize(name, phone_number, email)
    @name = name
    @phone_number = phone_number
    @email = email
  end

  # Will serialize an entry to a string.
  def to_s
    "\nName: #{@name}\nPhone Number: #{@phone_number}\nEmail: #{@email}\n"
  end
end
