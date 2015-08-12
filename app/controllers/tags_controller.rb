require 'responders'
class TagsController < ApplicationController
  respond_to :json
  def create
    @tag = Tag.create(name: params[:name], task_id: params[:id])
    respond_with @tag
  end

  def show
    #Task.all(where task.tags.each.name == params[:name])
  end
end
