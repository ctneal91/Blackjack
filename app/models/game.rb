class Game < ActiveRecord::Base
  has_many :hands
  has_many :cards

  def build_cards
    # 52 cards
    # 2 -> 10
    # J, Q, K (value 10)
    # A (value 11)
    # all have suits "H", "D", "C", "S"

    suits = ["H", "D", "C", "S"]
    suits.each do |suit|
      (2..10).each do |val|
        cards.create suit: suit, value: val, name: val
      end
      ["J", "Q", "K"].each do |val|
        cards.create suit: suit, value: 10, name: val
      end
      cards.create suit: suit, value: 11, name: "A"
    end
  end
  def player_hand
    hands.find_by player: true
  end

  def dealer_hand
    hands.find_by player: false
  end
end
