class GamesController < ApplicationController

  load_and_authorize_resource

  def index
    if current_user && current_user.role != "admin"
      @games = users_games(current_user)
    else
      @games = Game.all
    end
    @games = @games.sort_by{|e| e[:created_at]}.reverse!
  end

  def show
    @game = Game.find(params[:id])
    @move = Move.new(game_id: @game.id, user_id: @game.whose_turn.id)
  end

  def new
    @game = Game.new
    @game.challenger = current_user if current_user && current_user.role != "admin"
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

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

end