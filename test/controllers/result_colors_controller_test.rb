require 'test_helper'

class ResultColorsControllerTest < ActionController::TestCase
  setup do
    @result_color = result_colors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:result_colors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result_color" do
    assert_difference('ResultColor.count') do
      post :create, result_color: { color: @result_color.color, word: @result_color.word }
    end

    assert_redirected_to result_color_path(assigns(:result_color))
  end

  test "should show result_color" do
    get :show, id: @result_color
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result_color
    assert_response :success
  end

  test "should update result_color" do
    patch :update, id: @result_color, result_color: { color: @result_color.color, word: @result_color.word }
    assert_redirected_to result_color_path(assigns(:result_color))
  end

  test "should destroy result_color" do
    assert_difference('ResultColor.count', -1) do
      delete :destroy, id: @result_color
    end

    assert_redirected_to result_colors_path
  end
end
