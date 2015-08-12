require 'responders'
class FiltersController < ApplicationController
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

  def search
    @tasks = Task.where(list_id: params[:id])
    @tasks = @tasks.select{ |task| task.title.include?(params[:term]) }
    respond_with @tasks
  end

  def search_tags
    task = Task.find(params[:id])
    @tags = task.tags
    respond_with @tags
  end

  def search_reset
    @tasks = Task.where(list_id: params[:id])
    respond_with @tasks
  end
end
