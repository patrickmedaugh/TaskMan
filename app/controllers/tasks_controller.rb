class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task.list
    else
      render :new
      flash[:error] = "Invalid Task"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task.list
    else
      render :edit
      flash[:error] = "Invalid Task"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :notes, :due_date, :start_date, :status, :list_id)
  end
end
