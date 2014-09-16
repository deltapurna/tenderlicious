class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :registration_number, presence: true, uniqueness: true

  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users
end
