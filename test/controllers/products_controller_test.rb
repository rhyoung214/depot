require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:ruby)
    @update = {
      title:        'Lorem Ipsum',
      description:  'Wibbles are fun!',
      image_url:    'lorem.jpg',
      price:        19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update 
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

  test "should have a description" do
    get :index # will go to index page from the products controller
    assert_response :success # checks to see if response is a success
    assert_select '.products .list_description', count: 3 # looks for 3 list_description classes in the products class
    assert_select '.list_actions' do |elements| # loop that looks for all elements in list_actions
      elements.each do |element|
        assert_select element, "a", 3 # looks for 3 'a' tags in elements under list_actions
      end
    end 
  end
end
