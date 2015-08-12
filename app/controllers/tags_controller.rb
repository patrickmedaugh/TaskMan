require 'responders'
class TagsController < ApplicationController
  respond_to :json
  def create
    @tag = Tag.create(name: params[:name], task_id: params[:id])
    respond_with @tag
  end

  def show
    tag = Tag.find(params[:id])
    tasks = Task.all
    @tasks = tasks.select do |task|
      task.tags.any?{ |t| t.name == tag.name }
    end
  end
end
