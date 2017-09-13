require 'test_helper'

class OutletsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outlet = outlets(:one)
  end

  test "should get index" do
    get outlets_url, as: :json
    assert_response :success
  end

  test "should create outlet" do
    assert_difference('Outlet.count') do
      post outlets_url, params: { outlet: { estate: @outlet.estate } }, as: :json
    end

    assert_response 201
  end

  test "should show outlet" do
    get outlet_url(@outlet), as: :json
    assert_response :success
  end

  test "should update outlet" do
    patch outlet_url(@outlet), params: { outlet: { estate: @outlet.estate } }, as: :json
    assert_response 200
  end

  test "should destroy outlet" do
    assert_difference('Outlet.count', -1) do
      delete outlet_url(@outlet), as: :json
    end

    assert_response 204
  end
end
