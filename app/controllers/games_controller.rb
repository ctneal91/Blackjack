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
    redirect_to game_path(id: @game.id)
  end
end
