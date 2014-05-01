class MovesController < ApplicationController

  load_and_authorize_resource

  def create
    
    @game = Game.find(params[:move].delete(:game_id))

    if current_user == @game.whose_turn || current_user.role = "admin"

      @move = @game.moves.build(params[:move]) 

      unless @move.save
        flash[:notice] = "Could not make move due to the following errors:" + @move.errors.full_messages.to_sentence
      end
    else
      flash[:notice] = "Could not make move because it's not your turn"
    end

    redirect_to @game
  end

end
  