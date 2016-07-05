require 'test_helper'

class ConstraintsControllerTest < ActionController::TestCase
  setup do
    @constraint = constraints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:constraints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create constraint" do
    assert_difference('Constraint.count') do
      post :create, constraint: { title: @constraint.title }
    end

    assert_redirected_to constraint_path(assigns(:constraint))
  end

  test "should show constraint" do
    get :show, id: @constraint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @constraint
    assert_response :success
  end

  test "should update constraint" do
    patch :update, id: @constraint, constraint: { title: @constraint.title }
    assert_redirected_to constraint_path(assigns(:constraint))
  end

  test "should destroy constraint" do
    assert_difference('Constraint.count', -1) do
      delete :destroy, id: @constraint
    end

    assert_redirected_to constraints_path
  end
end
