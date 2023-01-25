class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = if request.original_url.split('movies').length != 1
                if request.original_url.include?('rating.kp') or request.original_url.include?('rating.imdb')
                  Movie.rating_scope(params['field'].split('.')[1], params['search'])
                else
                  Movie.movie_scope(params['field'], params['search'])
                end
              else
                Movie.all
              end
    render json: @movies, include: [
      :rating,
      { team: {
        include: %i[
          producer
          actor
        ]
      } }
    ]
  end
end
