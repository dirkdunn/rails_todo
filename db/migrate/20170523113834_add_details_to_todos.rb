class AddDetailsToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :test, :string
  end
end
