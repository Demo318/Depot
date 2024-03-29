require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "The Great Book #{rand(1000)}"
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should load products index in table" do
    get products_url
    assert_select 'table', 1
    assert_select 'tr', minimum: 1
    assert_select 'tfoot', 1
    assert_select 'tbody', 1
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @title } }
    assert_redirected_to product_url(@product)
  end

  # Since the publication of the book, Rails was updated to the original tests no
  # longer worked. The below test is different than the books, as suggested
  # here: https://forum.devtalk.com/t/agile-web-development-with-rails-7-page-118-test-fails/137572/3
  test "can't delete product in cart" do
    assert_raises(ActiveRecord::RecordNotDestroyed) do
      delete product_url(products(:two))
    end

    assert Product.exists?(products(:two).id)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end


end
