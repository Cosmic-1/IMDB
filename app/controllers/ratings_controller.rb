class RatingsController < ApplicationController
  before_action :set_movie, only: [:create]
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
      rating = Rating.new(movie: @movie, user: current_user, value: params[:value])
      if current_user.can_rate?(@movie) and rating.save
        head :created
      else
        head :bad_request
      end
  end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
