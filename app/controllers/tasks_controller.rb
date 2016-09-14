class TasksController < ApplicationController
    def new
        @task = Task.new
        @tasks = Task.all
    end
    
    def create
        Task.create(description: params[:task][:description])
        redirect_to root_path
    end
end
