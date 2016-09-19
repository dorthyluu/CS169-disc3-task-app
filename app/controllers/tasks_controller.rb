class TasksController < ApplicationController
    def new
        @task = Task.new
        @noncompleted_tasks = Task.where(completed: false)
        @completed_tasks = Task.where(completed: true)
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
        
        # OPTION 1: 
        # @task.update(params.require(:task).permit(:description, :completed))
        
        # OPTION 2:
        @task.update!(
            description: params[:task][:description],
            completed: params[:task][:completed])
        redirect_to root_path
    end
end
