require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest
  test 'sign up with correct parameters will create company and user' do
    valid_params = {
      name: 'a name',
      registration_number: 'a number',
      users_attributes: [
        {
          email: 'email@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
      ]
    }
    post '/companies', { company: valid_params }

    assert_equal 201, response.status
    assert_equal 'a name', Company.last.name
    assert_equal 'email@example.com', User.last.email
  end
end
