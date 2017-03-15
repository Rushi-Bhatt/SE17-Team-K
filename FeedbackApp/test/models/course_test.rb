require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(course_number: "CSC510", title: "Software Engineering", level: "Graduate", department_id: 1,
                         professor_id: 1)
  end

  test "course_number should be present" do
    @course.course_number = ""
    assert_not @course.valid?
  end
  test "title should be present" do
    @course.title = ""
    assert_not @course.valid?
  end
  test "level should be present" do
    @course.level = ""
    assert_not @course.valid?
  end
  test "department_id should be present" do
    @course.department_id = ""
    assert_not @course.valid?
  end
  test "professor_id should be present" do
    @course.professor_id = ""
    assert_not @course.valid?
  end
end
