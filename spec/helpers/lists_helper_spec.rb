require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ListsHelper. For example:
#
# describe ListsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ListsHelper, type: :helper do

  describe '#display_todo_state' do
    it 'prints checkmark if task state is true' do
      expect(helper.display_todo_state(true)).to eq('✔')
    end

    it 'prints cross char if task state is false' do
      expect(helper.display_todo_state(false)).to eq('✘')
    end
  end

  describe '#count_undone' do
    it 'returns undone tasks number' do
      todo1 = Todo.new(task: 'Task1', state: false)
      todo2 = Todo.new(task: 'Task2', state: false)
      todo3 = Todo.new(task: 'Task3', state: true)
      todos = [todo1, todo2, todo3]
      expect(helper.count_undone(todos)).to eq(2)
    end
  end
end
