require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_page_home_url
    assert_response :success
  end

  test "should get about" do
    get home_page_about_url
    assert_response :success
  end

end
