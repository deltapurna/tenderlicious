require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  test 'post #create with correct params will create a company' do
    valid_params = {
      name: 'a name',
      registration_number: 'a number'
    }
    assert_difference('Company.count') do
      post :create, { company: valid_params }
    end
    assert_response 201
    assert_not_nil assigns(:company)
  end
  test 'post #create with invalid params will render new and assigns company' do
    invalid_params = {
      name: nil,
      registration_number: nil
    }
    post :create, { company: invalid_params }
    assert_response 200
    assert_not_nil assigns(:company)
    assert_template :new
  end
end
