class AddBlackjackToHand < ActiveRecord::Migration
  def change
    add_column :hands, :blackjack, :boolean, default: false
  end
end
