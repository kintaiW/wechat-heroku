require 'test_helper'

class WechatControllerTest < ActionController::TestCase
  test "should get auth" do
    get :auth
    assert_response :success
  end

  test  "should post auth" do
    post :auth
    assert_response :success
    # assert_select "body","post success"
  end

end
