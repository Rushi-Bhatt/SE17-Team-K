require 'test_helper'

class ProfRatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new,save" do
    get prof_ratings_new,save_url
    assert_response :success
  end

end
