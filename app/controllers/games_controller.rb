class GamesController < ApplicationController

  def index
    if current_user
      @games = Game.where(challenger_id: current_user) | Game.where( invitee_id: current_user)
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
    @move = Move.new(game_id: @game.id, user_id: @game.whose_turn.id)
  end

  def new
    @game = Game.new
    @game.challenger = current_user if current_user
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