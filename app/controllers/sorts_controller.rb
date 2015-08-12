require 'responders'
class SortsController < ApplicationController
  respond_to :json

  def title
    @tasks = Task.where(list_id: params[:id]).order(:title)
    respond_with @tasks
  end

  def status
    @tasks = Task.where(list_id: params[:id]).order(:status)
    respond_with @tasks
  end

  def due_date
    @tasks = Task.where(list_id: params[:id]).order(:due_date)
    respond_with @tasks
  end
end
