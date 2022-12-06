require "test_helper"

class TaskTest < ActiveSupport::TestCase
  
  test "should not save task without name" do
    category = Category.create name: 'test category'
    task = category.tasks.build description: 'test description'
    assert_not task.save, 'saved task without name'
  end

  test 'should not save task name with less than 5 characters' do
      category = Category.create name: 'test category'
      task = category.tasks.build description: 'tests', name: 'tes'
      assert_not task.save, 'saved with name less than 5 characters'
  end

  test 'task description should not be empty' do
      category = Category.create name: 'test category'
      task = category.tasks.build name: 'test task'
      assert_not task.save, 'saved with empty description'
  end

  test 'task due date should not be previous date' do
      category = Category.create name: 'test category'
      task = category.tasks.build name: 'test task', description: 'tests', due: Date.new(2022, 12, 1)
      assert_not task.save, 'saved with a past date'
  end
end
