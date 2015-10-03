class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find params[:id]
  end

  def create
    @game = Game.create
    @game.build_cards

    player_hand = Hand.create game_id: @game.id, player: true
    dealer_hand = Hand.create game_id: @game.id, player: false

    player_hand.cards << @game.deck.first
    dealer_hand.cards << @game.deck.second

    player_hand.cards << @game.deck.third
    dealer_hand.cards << @game.deck.fourth

    player_count = 0
    player_hand.cards.each do |card|
      player_count = player_count + card.value
    end

    redirect_to game_path(id: @game.id)
  end
end
