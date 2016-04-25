require 'test_helper'

class AdminCanCreateItemsTest < ActionDispatch::IntegrationTest
  test "admin can create a new item" do
    admin = User.create(first_name: "Kris",
    last_name: "Foss",
    email: "kris.foss@gmail.com",
    password: "password",
    role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    create_categories(3)

    visit admin_dashboard_path
    click_on "Create New Items"

    assert page.has_content?("Item Creation Page")
    # save_and_open_page
    fill_in "Name", with: "Bronto Burgers"
    fill_in "Description", with: "Yum, meaty"
    fill_in "Image Url", with: "sample"
    fill_in "Price", with: 6.00
    fill_in "Category ID", with: "1"
    click_button "Create Item"

    assert items_path, current_path

    assert page.has_content?("Bronto Burgers")

    assert page.has_content?("Yum, meaty")

    assert page.has_content?("6.00")

    assert page.has_content?("6.00")


    #       I can create an item.
    #         - An item must have a title, description and price.
    #         - An item must belong to at least one category.
    #         - The title and description cannot be empty.
    #         - The title must be unique for all items in the system.
    #         - The price must be a valid decimal numeric value and greater than zero.
    #         - The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)

    # assert true

  end
end
