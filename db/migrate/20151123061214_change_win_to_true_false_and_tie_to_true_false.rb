class ChangeWinToTrueFalseAndTieToTrueFalse < ActiveRecord::Migration
  def change
    add_column :games, :player_wins, :boolean, default: false
    add_column :games, :dealer_wins, :boolean, default: false
    add_column :games, :push, :boolean, default: false
  end
end
