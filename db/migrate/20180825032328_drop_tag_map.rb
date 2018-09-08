class DropTagMap < ActiveRecord::Migration
  def change
    drop_table :tag_maps
  end
end
