require 'test_helper'

class AdminCanViewAllItemsTest < ActionDispatch::IntegrationTest
  test "  " do
    admin = User.create(first_name: "Kris",
    last_name: "Foss",
    email: "kris.foss@gmail.com",
    password: "password",
    role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    create_categories
    create_items(2)
    item1 = Item.first
    item2 = Item.last
    # As an Admin When I visit "/admin/dashboard"
    visit admin_dashboard_path
    #       Then I should see a link for viewing all items
    #       And when I click that link
    click_on "Items"
    #       Then my current path should be "/admin/items"
    assert_equal "/admin/items", current_path

    assert page.has_content?

    assert page.has_content? "All Items"

    within ".item#{item1.id}" do
      assert page.has_content? item1.name
      assert page.has_content? item1.description
      assert page.has_content? item1.retired
      assert page.has_content? "Edit"
    end

    within ".item#{item2.id}"  do
      assert page.has_content? item2.name
      assert page.has_content? item2.description
      assert page.has_content? item2.retired
      assert page.has_content? "Edit"
    end

    #       Then I should see a table with all items (active and inactive)
    #       And each item should have:
    #         - A thumbnail of the image
    #         - Title that links to the item
    #         - Description
    #         - Status
    #         - Actions (Edit)
  end
end
