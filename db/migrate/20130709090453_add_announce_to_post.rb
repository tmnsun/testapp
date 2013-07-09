class AddAnnounceToPost < ActiveRecord::Migration
  def change
    add_column :posts, :announce, :text
  end
end
