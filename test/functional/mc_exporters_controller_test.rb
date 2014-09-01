require 'test_helper'

class McExportersControllerTest < ActionController::TestCase
  setup do
    @mc_exporter = mc_exporters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mc_exporters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mc_exporter" do
    assert_difference('McExporter.count') do
      post :create, mc_exporter: { last_run: @mc_exporter.last_run, puppet_classes: @mc_exporter.puppet_classes }
    end

    assert_redirected_to mc_exporter_path(assigns(:mc_exporter))
  end

  test "should show mc_exporter" do
    get :show, id: @mc_exporter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mc_exporter
    assert_response :success
  end

  test "should update mc_exporter" do
    put :update, id: @mc_exporter, mc_exporter: { last_run: @mc_exporter.last_run, puppet_classes: @mc_exporter.puppet_classes }
    assert_redirected_to mc_exporter_path(assigns(:mc_exporter))
  end

  test "should destroy mc_exporter" do
    assert_difference('McExporter.count', -1) do
      delete :destroy, id: @mc_exporter
    end

    assert_redirected_to mc_exporters_path
  end
end
