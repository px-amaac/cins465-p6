require 'test_helper'

class DigitalObjectIdentifiersControllerTest < ActionController::TestCase
  setup do
    @digital_object_identifier = digital_object_identifiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:digital_object_identifiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create digital_object_identifier" do
    assert_difference('DigitalObjectIdentifier.count') do
      post :create, digital_object_identifier: { description: @digital_object_identifier.description, integer_identifier: @digital_object_identifier.integer_identifier, string_identifier: @digital_object_identifier.string_identifier }
    end

    assert_redirected_to digital_object_identifier_path(assigns(:digital_object_identifier))
  end

  test "should show digital_object_identifier" do
    get :show, id: @digital_object_identifier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @digital_object_identifier
    assert_response :success
  end

  test "should update digital_object_identifier" do
    patch :update, id: @digital_object_identifier, digital_object_identifier: { description: @digital_object_identifier.description, integer_identifier: @digital_object_identifier.integer_identifier, string_identifier: @digital_object_identifier.string_identifier }
    assert_redirected_to digital_object_identifier_path(assigns(:digital_object_identifier))
  end

  test "should destroy digital_object_identifier" do
    assert_difference('DigitalObjectIdentifier.count', -1) do
      delete :destroy, id: @digital_object_identifier
    end

    assert_redirected_to digital_object_identifiers_path
  end
end
