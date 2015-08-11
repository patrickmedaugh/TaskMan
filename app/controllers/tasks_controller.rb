class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to list_path(@task.list_id)
    else
      render :new
      flash[:error] = "Invalid Task"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :start_date, :status, :list_id)
  end
end
