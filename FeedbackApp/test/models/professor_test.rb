require 'test_helper'

class ProfessorTest < ActiveSupport::TestCase
  def setup
    @professor = Professor.new(name: "Timm")
  end

  test "name should be present" do
    @professor.name = ""
    assert_not @professor.valid?
  end
end
