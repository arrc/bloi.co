class AddColumnSlugOnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
end
