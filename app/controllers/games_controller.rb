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

    redirect_to game_path(id: @game.id)
  end

  def hit
    @game = Game.find params[:id]

    if @game.player_hand.total < 21
      @game.player_hand.cards << @game.deck.first
    end

    redirect_to game_path(id: @game.id)
  end

  def stay
    @game = Game.find params[:id]

    if @game.dealer_hand.total < 17
      @game.dealer_hand.cards << @game.deck.first
    end

    redirect_to game_path(id: @game.id)
  end
end
