class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render json: @movies, include: [:rating, :team => {:include => :actor}]
  end
end
