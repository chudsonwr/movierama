class VotesController < ApplicationController
  def create
    authorize! :vote, _movie
    _voter.vote(_type)
    redirect_to root_path, notice: 'Vote cast'
    movie_user = _movie_user(_movie)
    UserNotifier.send_notification_email(movie_user.email, current_user.name, _movie.title).deliver
    # TODO: Add delayed delivery to notification
  end

  def destroy
    authorize! :vote, _movie

    _voter.unvote
    redirect_to root_path, notice: 'Vote withdrawn'
  end

  private

  def _voter
    VotingBooth.new(current_user, _movie)
  end

  def _type
    case params.require(:t)
    when 'like' then :like
    when 'hate' then :hate
    else raise
    end
  end

  def _movie_user(_movie)
    @_movie_user ||= User[_movie.attributes[:user_id]]
  end

  def _movie
    @_movie ||= Movie[params[:movie_id]]
  end
end