class MovesController < ApplicationController


  def create
    
    @game = Game.find(params[:move].delete(:game_id))

    @move = @game.moves.build(params[:move]) 

    unless @move.save
      flash[:notice] = "Could not make move due to the following errors: " + @move.errors.full_messages.to_sentence
    end
    redirect_to @game
  end

end
  