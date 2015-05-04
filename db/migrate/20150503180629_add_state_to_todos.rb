class AddStateToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :state, :boolean, default: false
  end
end
