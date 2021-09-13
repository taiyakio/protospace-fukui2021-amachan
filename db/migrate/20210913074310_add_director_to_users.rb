class AddDirectorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :director, :string
  end
end
