require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  def setup
    @department = Department.new(name: "CS")
  end

  test "name should be present" do
    @department.name = ""
    assert_not @department.valid?
  end
end
