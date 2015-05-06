require_relative "../controllers/menu_controller"

RSpec.describe MenuController do
  controller = MenuController.new()
  context "when importing the file" do
    it "reads the filename from STDIN and parses it, expects a CSV" do
      stdin = MockStream.new('entries.txt')
      stdout = MockStream.new
      controller.read_csv(stdin, stdout)
      expect controller.address_book != nil
    end
  end
end
