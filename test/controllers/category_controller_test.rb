require 'test_helper'
# add view files later
class CategoryControllerTest < ActionDispatch::IntegrationTest
 
    test "should get index" do 
        get category_path
        assert_response :success
    end

    test "should get new" do
        get new_category_path
        assert_response :success
    end

    test "should post create" do
        post create_category_path, params:{category: {name: 'geometry'} }
        assert_response :redirect
    end
end