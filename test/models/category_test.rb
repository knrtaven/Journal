require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    test "should not save category without name" do
        category = Category.new 
        assert_not category.save, 'Saved category without name'
    end

    test "should not save with name character less then 5" do
        category = Category.new
        category.name = 'art'
        assert_not category.save, 'Name saved with less than 5 characters'
    end
end
