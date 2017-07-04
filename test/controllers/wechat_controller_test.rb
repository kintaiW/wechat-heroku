require 'test_helper'

class WechatControllerTest < ActionController::TestCase
  test "should get auth" do
    get :auth
    assert_response :success
  end

end
