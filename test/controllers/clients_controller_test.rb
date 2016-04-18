require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { ZIP_code: @client.ZIP_code, business_name: @client.business_name, contact_email: @client.contact_email, contact_phone: @client.contact_phone, frequency: @client.frequency, neighborhood: @client.neighborhood, payment: @client.payment, route_id: @client.route_id, street_address: @client.street_address }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { ZIP_code: @client.ZIP_code, business_name: @client.business_name, contact_email: @client.contact_email, contact_phone: @client.contact_phone, frequency: @client.frequency, neighborhood: @client.neighborhood, payment: @client.payment, route_id: @client.route_id, street_address: @client.street_address }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
