class Professor < ApplicationRecord
  validates :name, :presence => {:message => "Please enter the name"}, uniqueness: true
end
