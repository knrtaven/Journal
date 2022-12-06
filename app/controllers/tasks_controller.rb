class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category
    def index
        @tasks = @category.tasks
    end 

    def new
        @task = @category.tasks.build
    end

    def create
        @task = @category.tasks.build(task_params)
        # debugger
        if @task.save!
            redirect_to category_tasks_path
        else
            render :new
        end
    end
    
    def show
        @task = @category.tasks.find(params[:id])
    end

    def edit
        @task = @category.tasks.find(params[:id])
    end

    def update
        @task = @category.tasks.find(params[:id])

        if @task.update(edit_task_params)
            redirect_to category_task_path(@category, @task)
        else
            render :edit
        end
    end

    def destroy
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_tasks_path
    end

    private
    def get_category
        @category = Category.find(params[:category_id])
    end

    def edit_task_params
        params.require(:task).permit(:name, :description, :category_id)
    end

    def task_params
        params.require(:task).permit(:name, :description, :category_id, :due)
    end

end
