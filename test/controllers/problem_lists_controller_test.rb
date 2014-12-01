require 'test_helper'

class ProblemListsControllerTest < ActionController::TestCase
  setup do
    @problem_list = problem_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problem_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem_list" do
    assert_difference('ProblemList.count') do
      post :create, problem_list: { description: @problem_list.description, title: @problem_list.title }
    end

    assert_redirected_to problem_list_path(assigns(:problem_list))
  end

  test "should show problem_list" do
    get :show, id: @problem_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem_list
    assert_response :success
  end

  test "should update problem_list" do
    patch :update, id: @problem_list, problem_list: { description: @problem_list.description, title: @problem_list.title }
    assert_redirected_to problem_list_path(assigns(:problem_list))
  end

  test "should destroy problem_list" do
    assert_difference('ProblemList.count', -1) do
      delete :destroy, id: @problem_list
    end

    assert_redirected_to problem_lists_path
  end
end
