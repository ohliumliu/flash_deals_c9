require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  test "should get submit_deal" do
    get :submit_deal
    assert_response :success
  end

end
