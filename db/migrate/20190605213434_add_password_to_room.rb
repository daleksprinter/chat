class AddPasswordToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :password, :string
  end
end
