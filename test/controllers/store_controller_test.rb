require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select 'nav a', minimum: 4
    assert_select 'main ul li', 3
    assert_select 'h2', 'Programming Ruby 1.9'

    # Confirms there's a div that's displaying a price: Starts with a $,
    # then any number of commas and digits, then a decimal point, then
    # two digits.
    assert_select 'div', /\$[, \d]+\.\d\d/
  end
end
