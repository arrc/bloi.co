class AddUserIdColumnOnTopicsTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :topics, :user, index: true, foreign_key: true
  end
end
