require 'test_helper'

class WantedsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wanteds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wanted" do
    assert_difference('Wanted.count') do
      post :create, :wanted => { }
    end

    assert_redirected_to wanted_path(assigns(:wanted))
  end

  test "should show wanted" do
    get :show, :id => wanteds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => wanteds(:one).to_param
    assert_response :success
  end

  test "should update wanted" do
    put :update, :id => wanteds(:one).to_param, :wanted => { }
    assert_redirected_to wanted_path(assigns(:wanted))
  end

  test "should destroy wanted" do
    assert_difference('Wanted.count', -1) do
      delete :destroy, :id => wanteds(:one).to_param
    end

    assert_redirected_to wanteds_path
  end
end
