require 'test_helper'

class DecimalsControllerTest < ActionController::TestCase
  setup do
    @decimal = decimals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:decimals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create decimal" do
    assert_difference('Decimal.count') do
      post :create, decimal: { number: @decimal.number }
    end

    assert_redirected_to decimal_path(assigns(:decimal))
  end

  test "should show decimal" do
    get :show, id: @decimal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @decimal
    assert_response :success
  end

  test "should update decimal" do
    patch :update, id: @decimal, decimal: { number: @decimal.number }
    assert_redirected_to decimal_path(assigns(:decimal))
  end

  test "should destroy decimal" do
    assert_difference('Decimal.count', -1) do
      delete :destroy, id: @decimal
    end

    assert_redirected_to decimals_path
  end
end
