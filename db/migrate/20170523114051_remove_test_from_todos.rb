class RemoveTestFromTodos < ActiveRecord::Migration[5.1]
  def change
    remove_column :todos, :test, :string
  end
end
