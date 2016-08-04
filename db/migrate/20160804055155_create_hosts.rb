class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :favicon
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
