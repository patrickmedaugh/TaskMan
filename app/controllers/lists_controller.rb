class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
