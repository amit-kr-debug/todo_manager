class TodosController < ApplicationController
  def index
    render plain: Todo.order(:due_date).all.map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    response_text = "Hey, your new todo is created with id #{new_todo.id}"
    render plain: response_text
  end

  def update
    todo_id = params[:id]
    completed = params[:completed]
    todo = Todo.find(todo_id)
    todo.completed = completed
    todo.save!
    render plain: "updated todo status to #{completed}"
  end
end
