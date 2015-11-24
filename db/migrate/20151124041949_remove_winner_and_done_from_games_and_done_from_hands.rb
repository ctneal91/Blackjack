class RemoveWinnerAndDoneFromGamesAndDoneFromHands < ActiveRecord::Migration
  def change
    remove_column :hands, :done, :boolean, default: false
    remove_column :games, :done, :boolean, default: false
    remove_column :games, :winner, :string
  end
end
