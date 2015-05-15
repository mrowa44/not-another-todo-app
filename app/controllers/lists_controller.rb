class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :show, :update,  :destroy]
  before_action :authenticate_user!

  def index
    @lists = current_user.lists.all
    @list = current_user.lists.build
  end

  def show
    @todos = @list.todos.all.order(state: :asc)
    @todo = @list.todos.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:success] = 'List successfully created!'
      redirect_to @list
    else
      @lists = current_user.lists.all
      render :index
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
      @list = current_user.lists.find(params[:id])
    end
   
    def list_params
      params.require(:list).permit(:title)
    end
end
