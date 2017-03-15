require 'test_helper'

class ProfRatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new,save" do
    get new_prof_rating_path
    assert_response :success
  end

end
