class TasksController < ApplicationController
    def new
        @task = Task.new
        @completed_tasks = Task.where(completed: true)
        @noncompleted_tasks = Task.where(completed: false)
    end
    
    def create
        Task.create(description: params[:task][:description])
        redirect_to root_path
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        @task.update!(
            description: params[:task][:description],
            completed: params[:task][:completed])
        redirect_to root_path
    end
end
