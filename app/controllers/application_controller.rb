class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :users_games
  helper_method :total_score

  def users_games(user)
      @games = Game.where(challenger_id: user) | Game.where( invitee_id: user)
  end

  def total_score(user)
    score = 0
    users_games(user).each do |game|
      score += game.score(user)
    end
    return score
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url , notice: "You can't access that page"
  end
  
  private
  def authenticate
    unless logged_in?
      flash[:notice] = "You must be logged in to access this section of the site"
      redirect_to login_url
    end
  end
  
end
