module ListsHelper
  def display_todo_state(state)
    state ? '✔' : '✘'
  end
  
  def count_undone(todos)
    count = 0
    todos.each do |todo|
      count += 1 if todo.state == false
    end
    count
  end
end
