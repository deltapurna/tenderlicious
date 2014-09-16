class Project < ActiveRecord::Base
  validates :name, :budget, presence: true
  belongs_to :company
end
