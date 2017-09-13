require 'test_helper'

class DomicilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @domicile = domiciles(:one)
  end

  test "should get index" do
    get domiciles_url, as: :json
    assert_response :success
  end

  test "should create domicile" do
    assert_difference('Domicile.count') do
      post domiciles_url, params: { domicile: { address: @domicile.address, city: @domicile.city } }, as: :json
    end

    assert_response 201
  end

  test "should show domicile" do
    get domicile_url(@domicile), as: :json
    assert_response :success
  end

  test "should update domicile" do
    patch domicile_url(@domicile), params: { domicile: { address: @domicile.address, city: @domicile.city } }, as: :json
    assert_response 200
  end

  test "should destroy domicile" do
    assert_difference('Domicile.count', -1) do
      delete domicile_url(@domicile), as: :json
    end

    assert_response 204
  end
end
