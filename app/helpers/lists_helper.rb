module ListsHelper
  def display_todo_state(state)
    state ? '✔' : '✘'
  end
end
