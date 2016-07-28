class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.text :description
      t.boolean :is_public

      t.timestamps
    end
  end
end
