require 'test_helper'
# add view files later
class CategoryControllerTest < ActionDispatch::IntegrationTest

    setup do
        @category = categories(:one)
    
        get '/users/sign_in'
        sign_in users(:test_user)
        post user_session_url
    end
 
    test "should get index" do 
        get categories_path
        assert_response :success
    end

    test "should get new category" do
        get new_category_path
        assert_response :success
    end

    test "should create category" do
        post categories_path, params: {category: { name: 'geometry' } }
        assert_response :redirect
    end

    test "should update category" do
        category = Category.create name: 'category 1'
        put category_path @category, params: {category: {name: 'geometry'} }
        assert_response :redirect
    end

    test "should show category" do
        category = Category.create name: 'category test'
        get category_path(@category)
        assert_response :success
    end

    test "should delete category" do
        category = Category.create name: 'test category'
        delete category_path(@category)
        assert_response :redirect
    end 
end