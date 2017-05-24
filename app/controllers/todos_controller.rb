class TodosController < ApplicationController

  def index
    @todos = Todo.last(5).reverse
  end

  def new
    @todo = Todo.new
    @todos = Todo.last(5).reverse
  end

  def create
    # Using rails 4 "strong params" to whitelist only certain params for this route
    # when a request is made here, we grab name and description from params, and put them in .new
    @todo = Todo.new(todo_params)
    @todo.save
    # Todo.create(name: params[:todo][:name], description: params[:todo][:description])

    # puts Todo.create(name: params[:todo][:name], description: params[:todo][:description])
    redirect_to todo_path(:index)
  end

  private

  # only permit name & description parameters during this request.
  # this is good when you want to just slap todo_params in a .update method or something,
  # and not have to worry about hackers putting in url params to screw up your db
  def todo_params
    params.require(:todo).permit(:name, :description)
  end

end
