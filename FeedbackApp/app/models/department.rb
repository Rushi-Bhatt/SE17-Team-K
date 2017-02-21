class Department < ApplicationRecord
  validates :name, :presence => {:message => "Please enter the dept name"} , uniqueness: true
end
