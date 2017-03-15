require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @review = Review.new(course_id: 1, user_id: 1, content: "Haha", likes: 1, dislikes:1)
  end

  test "course_id should be present" do
    @review.course_id = ""
    assert_not @review.valid?
  end

  test "user_id should be present" do
    @review.user_id = ""
    assert_not @review.valid?
  end

  test "content should be present" do
    @review.content = ""
    assert_not @review.valid?
  end

  test "likes should be present" do
    @review.likes = ""
    assert_not @review.valid?
  end

  test "dislikes should be present" do
    @review.dislikes = ""
    assert_not @review.valid?
  end
end
