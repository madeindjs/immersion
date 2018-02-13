require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should redirect on get new" do
    get new_product_url
    assert_redirected_to signin_path
  end

  test "should get new" do
    login(users(:me))
    get new_product_url
    assert_response :success
  end

  test "should redirect create product" do
    assert_no_difference('Product.count') do
      post products_url, params: { product: { name: @product.name, user: @product.user } }
    end

    assert_redirected_to signin_path
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should redirect on get edit" do
    get edit_product_url(@product)
    assert_redirected_to signin_path
  end

  test "should get edit" do
    login(users(:me))
    get edit_product_url(@product)
    assert_response :success
  end

  test "should redirect on update product" do
    patch product_url(@product), params: { product: { name: @product.name} }
    assert_redirected_to signin_path
  end

  test "should update product" do
    login(users(:me))
    patch product_url(@product), params: { product: { name: @product.name} }
    assert_redirected_to product_url(@product)
  end

  test "should redirect destroy product" do
    assert_no_difference('Product.count') do
      delete product_url(@product)
    end

    assert_redirected_to signin_path
  end

  test "should destroy product" do
    login(users(:me))
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
