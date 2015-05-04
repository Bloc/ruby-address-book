require 'entry'

RSpec.describe Entry, "#to_s" do
  context "deserialization" do
    it "prints an entry as a string" do
      entry = Entry.new('Rob Madden', '630.768.6995', 'madden.rob@gmail.com')
      expect entry.to_s.eql? "Name: #{entry.name}\nPhone Number: \##{entry.phone_number}\nEmail: #{entry.email}"
    end
  end
end
