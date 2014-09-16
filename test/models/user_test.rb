require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'email must present' do
    user = User.new(email: nil, password: 'password')
    assert_equal false, user.valid?
  end
  test 'password must present' do
    user = User.new(email: 'a@a.com', password: nil)
    assert_equal false, user.valid?
  end
  test 'belongs to company' do
    assert_respond_to users(:one), :company
    assert_respond_to users(:one), :company_id
  end
end
