require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'name must be present' do
    project = Project.new(name: nil, budget: 100)
    assert_equal false, project.valid?
  end
  test 'budget must be present' do
    project = Project.new(name: 'a name', budget: nil)
    assert_equal false, project.valid?
  end
  test 'belongs to company' do
    assert_respond_to projects(:one), :company
    assert_respond_to projects(:one), :company_id
  end
end
