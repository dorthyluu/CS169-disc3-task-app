class TasksController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @task = Task.new
        # Group non completed tasks by the value of their urgent column
        @noncompleted_tasks = Task.where(completed: false, user: current_user).group_by(&:urgent)
        @noncompleted_tasks.transform_keys! do |urgent|
            urgent ? "urgent_tasks" : "non_urgent_tasks"
        end
        @completed_tasks = Task.where(completed: true, user: current_user)
    end
    
    def create
        Task.create(description: params[:task][:description], user: current_user)
        redirect_to root_path
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        
        # OPTION 1: Strong parameters method
        # @task.update(params.require(:task)
        #   .permit(:description, :completed, :urgent))
        
        # OPTION 2:
        @task.update!(
            description: params[:task][:description],
            completed: params[:task][:completed],
            urgent: params[:task][:urgent])
        redirect_to root_path
    end
end
