class PlayerStayedbooleanadded < ActiveRecord::Migration
  def change
    add_column :games, :player_stayed, :boolean, default: false
  end
end
