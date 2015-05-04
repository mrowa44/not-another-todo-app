class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :show, :update,  :destroy]

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @todos = @list.todos.all
    @todo = @list.todos.build
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = 'List successfully created!'
      redirect_to @list
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      flash[:success] = "List was successfully updated!"
      redirect_to @list
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

    def set_list
      @list = List.find(params[:id])
    end
   
    def list_params
      params.require(:list).permit(:title)
    end
end
