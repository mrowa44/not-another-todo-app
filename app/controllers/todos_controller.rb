class TodosController < ApplicationController
  before_action :set_list, only: [:edit, :update, :create]
  before_action :set_todo, only: [:edit, :update]

  def create
    @todo = @list.todos.build(todo_params)
    if @todo.save
      redirect_to list_path(@todo.list)
    else
      render list_path(@list)
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:success] = "To do updated!"
      redirect_to @list
    else
      render :edit
    end
  end

  private

    def set_list
      @list = List.find(params[:list_id])
    end

    def set_todo
      @todo = @list.todos.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:task, :state)
    end

end
