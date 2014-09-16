class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :registration_number, presence: true, uniqueness: true
end
