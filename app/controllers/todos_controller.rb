class TodosController < ApplicationController
  before_action :set_list, only: [:update, :create, :destroy, :complete, :uncomplete, :clear]
  before_action :set_todo, only: [:update, :destroy, :complete, :uncomplete]

  def create
    @todo = @list.todos.build(todo_params)
    if @todo.save
      redirect_to list_path(@todo.list)
    else
      @todos = @list.todos.all
      render 'lists/show'
    end
  end

  def update
    if @todo.update(todo_params)
      flash[:success] = "To do updated!"
      redirect_to @list
    else
    end
  end

  def complete
    @todo.update_attribute(:state, true)
    redirect_to @list
  end

  def uncomplete
    @todo.update_attribute(:state, false)
    redirect_to @list
  end

  def clear
    @list.todos.find_each do |todo|
      todo.destroy if todo.completed?
    end
    redirect_to @list
  end

  def destroy
    @todo.destroy
    flash[:success] = "Todo deleted!"
    redirect_to @list
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
