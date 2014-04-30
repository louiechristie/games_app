class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @move = Move.new(game_id: @game.id, user_id: @game.whose_turn.id)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])

    unless @game.save
      flash[:notice] = "Could not create game due to the following errors: " + @game.errors.full_messages.to_sentence
    redirect_to new_game_path
    else
      redirect_to @game
    end


  end

end