class PagesController < ApplicationController
  def hello
    @todos = Todo.last(5).reverse
  end

  def about
  end

  def help
  end

  def create
    Todo.create(name: params[:todo][:name], description: params[:todo][:description])
    redirect_to '/'
  end
end
