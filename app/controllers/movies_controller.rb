class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render json: @movies, :include => [
      :rating,
      :team => {
        :include => [
          :producer,
          :actor
        ]
      }
    ]
  end
  def show
    @movie = Movie.find_by(genre: params[:genre])
    render json: @movie
  end


  # def show
    # @movies = Movie.all
    # @movies.kp(@movies.find(params[:id]).id)
    # res = []
    # @movies.each do |movie|
      # if movie.rating.kp == 5
        # res << movie
        # p movie.rating.kp
        # p movie.rating.imdb
      # end
   # end
    # render json: res
  # end

end
