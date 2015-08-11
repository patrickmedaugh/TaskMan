require 'responders'
class StatusesController < ApplicationController
  respond_to :json

  def complete
    @task = Task.find(params[:id])
    @task.update(status: "complete")
    respond_with @task
  end

  def incomplete
    @task = Task.find(params[:id])
    @task.update(status: "incomplete")
    respond_with @task
  end
end
