class GamesController < ApplicationController
  outcome = nil

  def index
  end

  def show
    @game = Game.find params[:id]

    if ((@game.dealer_hand.cards.count == 2) && (@game.dealer_hand.total == 21)) && ((@game.player_hand.cards.count == 2) && (@game.player_hand.total == 21))
      @game.dealer_hand.blackjack = true
      @game.player_hand.blackjack = true
      @game.push = true
      @game.dealer_hand.dealer_must_reveal = true
    elsif (@game.player_hand.cards.count == 2) && (@game.player_hand.total == 21)
      @game.player_hand.blackjack = true
      @game.player_wins = true
    elsif (@game.dealer_hand.cards.count == 2) && (@game.dealer_hand.total == 21)
      @game.dealer_hand.blackjack = true
      @game.dealer_wins = true
      @game.dealer_hand.dealer_must_reveal = true
    elsif (@game.player_hand.total > 21)
      @game.dealer_wins = true
    elsif (@game.player_hand.cards.count == 6)
      @game.player_wins = true
    elsif (@game.dealer_hand.total >= 17) && (@game.player_stayed == true)
      if @game.dealer_hand.total > 21
        @game.player_wins = true
        @game.dealer_hand.dealer_must_reveal = true
      elsif @game.dealer_hand.total > @game.player_hand.total
        @game.dealer_wins = true
        @game.dealer_hand.dealer_must_reveal = true
      elsif @game.dealer_hand.total == @game.player_hand.total
        @game.push = true
        @game.dealer_hand.dealer_must_reveal = true
      elsif @game.player_hand.total > @game.dealer_hand.total
        @game.player_wins = true
        @game.dealer_hand.dealer_must_reveal = true
      end
    end

    @player_wins = @game.player_wins
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

    @game.player_stayed = true
    @game.save
    if @game.dealer_hand.total < 17
      until @game.dealer_hand.total >= 17
        @game.dealer_hand.cards << @game.deck.first
      end
    end

    redirect_to game_path(id: @game.id)
  end
end
