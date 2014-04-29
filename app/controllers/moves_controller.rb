class MovesController < ApplicationController


  def new
    @move = move.new
  end

  def create
    @move = Move.create(params[:move]) 
    @game = Game.find(params[:move][:game_id])
    redirect_to @game
  end

end
  