require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test 'name must exist' do
    company = Company.new(name: nil)
    assert_equal false, company.valid?
  end
  test 'registration number must exist' do
    company = Company.new(name: 'a name', registration_number: nil)
    assert_equal false, company.valid?
  end
  test 'registration number must be unique' do
    company = Company.create(name: 'a name', registration_number: 'a number')
    new_company = Company.new(name: 'a new name', registration_number: company.registration_number)
    assert_equal false, new_company.valid?
  end
  test 'has many projects' do
    assert_respond_to companies(:one), :projects
  end
  test 'has many users' do
    assert_respond_to companies(:one), :users
  end
  test 'has many dependent destroy' do
    # users(:one) belongs to companies(:one)
    companies(:one).destroy
    assert_raises ActiveRecord::RecordNotFound do 
      users(:one) 
    end
  end
end
