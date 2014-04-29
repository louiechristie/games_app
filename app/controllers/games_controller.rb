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

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      redirect_to new_game_path, notice: 'Game was not created.'
    end
  end

end