class AddFaviconAndHostnameToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :hostname, :string
    add_column :bookmarks, :favicon, :string, index: true
  end
end
