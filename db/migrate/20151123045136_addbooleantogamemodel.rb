class Addbooleantogamemodel < ActiveRecord::Migration
  def change
    add_column :games, :done, :boolean, default: false
  end
end
