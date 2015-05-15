require 'rails_helper'

RSpec.describe Todo, type: :model do

  it { should belong_to :list }
  it { should validate_presence_of :task }

  it '#completed? should by default be false' do
    todo = Todo.new(task: 'Some task')
    expect(todo.completed?).to eq false
  end

  it '#completed? should return true if state is true' do
    todo = Todo.new(task: 'Some task')
    todo.update(state: true)
    expect(todo.completed?).to eq true
  end
end
