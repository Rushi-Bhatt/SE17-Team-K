require 'test_helper'

class ProfRatingTest < ActiveSupport::TestCase
  def setup
    @prof_rating = ProfRating.new(professor_id: 1, fluency: 1, course_material: 1, knowledge: 1, doubt_solving:1)
  end

  test "professor_id should be present" do
    @prof_rating.professor_id = ""
    assert_not @prof_rating.valid?
  end

  test "fluency should be present" do
    @prof_rating.fluency = ""
    assert_not @prof_rating.valid?
  end

  test "course_material should be present" do
    @prof_rating.course_material = ""
    assert_not @prof_rating.valid?
  end

  test "knowledge should be present" do
    @prof_rating.knowledge = ""
    assert_not @prof_rating.valid?
  end

  test "doubt_solving should be present" do
    @prof_rating.doubt_solving = ""
    assert_not @prof_rating.valid?
  end
end
