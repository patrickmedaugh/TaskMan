require 'responders'
class FiltersController < ApplicationController
  respond_to :json

  def start_date
    @tasks = Task.where(start_date: params[:start_date]).where(list_id: params[:id])
    respond_with @tasks
  end

  def status
    @tasks = Task.where(status: params[:status]).where(list_id: params[:id])
    respond_with @tasks
  end

  def due_date
    @tasks = Task.where(due_date: params[:due_date]).where(list_id: params[:id])
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

  def tags
    @tasks = Task.all
    @tasks = @tasks.select do |task|
      task.tags.any? { |t| t.name == params[:name] }
    end
    respond_with @tasks
  end
end
