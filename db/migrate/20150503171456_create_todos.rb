class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task
      t.belongs_to :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
