class DealerShowCardToHand < ActiveRecord::Migration
  def change
    add_column :hands, :dealer_must_reveal, :boolean, default: false
  end
end
