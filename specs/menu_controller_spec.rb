require_relative "../controllers/menu_controller"

RSpec.describe MenuController do
  controller = MenuController.new()
  context "when importing the file" do
    it "BLAH" do
      input = StringIO.new("entries.csv\n")
      stdin = input.gets
      controller.read_csv()
      expect controller.address_book != nil
    end
  end
end
