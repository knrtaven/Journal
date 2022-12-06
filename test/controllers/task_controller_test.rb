require "test_helper"

class TaskControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @category = categories(:one)
    get '/users/sign_in'
    sign_in users(:test_user)
    post user_session_url

    @task = @category.tasks.create name: 'test task', description: 'test desc'
  end

  test 'should get index for task' do
    get category_tasks_path(@category)
    assert_response :success
  end

  test 'should get new task' do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should create task" do
    assert_difference "Task.count", 1 do
      # debugger
      post category_tasks_path(@category), params:{task: {name: 'new task', description: 'test descri'} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end

  

  test "should delete task" do
    assert_difference "Task.count", -1 do
      # debugger
      delete category_task_path(@category, @task)
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end
