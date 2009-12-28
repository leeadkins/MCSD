require 'test_helper'

class OffendersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offenders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offender" do
    assert_difference('Offender.count') do
      post :create, :offender => { }
    end

    assert_redirected_to offender_path(assigns(:offender))
  end

  test "should show offender" do
    get :show, :id => offenders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => offenders(:one).to_param
    assert_response :success
  end

  test "should update offender" do
    put :update, :id => offenders(:one).to_param, :offender => { }
    assert_redirected_to offender_path(assigns(:offender))
  end

  test "should destroy offender" do
    assert_difference('Offender.count', -1) do
      delete :destroy, :id => offenders(:one).to_param
    end

    assert_redirected_to offenders_path
  end
end
