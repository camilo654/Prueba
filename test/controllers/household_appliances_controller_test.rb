require 'test_helper'

class HouseholdAppliancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @household_appliance = household_appliances(:one)
  end

  test "should get index" do
    get household_appliances_url, as: :json
    assert_response :success
  end

  test "should create household_appliance" do
    assert_difference('HouseholdAppliance.count') do
      post household_appliances_url, params: { household_appliance: { electricity_use: @household_appliance.electricity_use, name: @household_appliance.name } }, as: :json
    end

    assert_response 201
  end

  test "should show household_appliance" do
    get household_appliance_url(@household_appliance), as: :json
    assert_response :success
  end

  test "should update household_appliance" do
    patch household_appliance_url(@household_appliance), params: { household_appliance: { electricity_use: @household_appliance.electricity_use, name: @household_appliance.name } }, as: :json
    assert_response 200
  end

  test "should destroy household_appliance" do
    assert_difference('HouseholdAppliance.count', -1) do
      delete household_appliance_url(@household_appliance), as: :json
    end

    assert_response 204
  end
end
