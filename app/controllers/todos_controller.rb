class TodosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @todos = @user.todos
  end

  def new
    @user = User.find(params[:user_id])
    @todo = Todo.new
  end

  def create
    @user = User.find(params[:user_id])
    @todo = @user.todos.new(todo_params)
    if @todo.save
      redirect_to user_todos_path, notice: "Todo successfully created"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @todo = Todo.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
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
