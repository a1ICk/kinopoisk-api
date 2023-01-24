class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render json: @movies, include: [:team => {:include => :actor}]
  end
end
