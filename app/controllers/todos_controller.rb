class TodosController < ApplicationController

  def index
    @todos = Todo.last(5).reverse
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "Todo was successfully destroyed!"

    redirect_to todos_path

  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated!"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def create
    # Using rails 4 "strong params" to whitelist only certain params for this route
    # when a request is made here, we grab name and description from params, and put them in .new

    @todo = Todo.new(todo_params)
    # @todo will have errors @todo.errors.full_messages if it doesnt work.
    # Todo.create(name: params[:todo][:name], description: params[:todo][:description])
    # puts Todo.create(name: params[:todo][:name], description: params[:todo][:description])

    if @todo.save
      # Create a flash message
      flash[:notice] = "Todo was created successfully!"
      redirect_to todo_path(@todo)
    else
      render "new"
    end

  end


  private
  # only permit name & description parameters during this request.
  # this is good when you want to just slap todo_params in a .update method or something,
  # and not have to worry about hackers putting in url params to screw up your db
  def todo_params
    params.require(:todo).permit(:name, :description)
  end

end
