class AddCatNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cat_name, :string
  end
end
