class TodosController < ApplicationController
  before_action :require_signin

  def index
    @todos = @user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = @user.todos.new(todo_params)
    if @todo.save
      redirect_to user_todos_path, notice: "Todo successfully created"
    else
      render 'new'
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to user_todos_path, notice: "Todo successfully created"
    else
      render 'edit'
    end
  end

  private
  def todo_params
    params.required(:todo).permit(:description)
  end
end
