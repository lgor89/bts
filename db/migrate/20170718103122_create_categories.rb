class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :name
      t.text :cat_type
      t.money :summ
      t.integer :user_id

      t.timestamps
    end
  end
end
