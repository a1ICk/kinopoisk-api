# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :show_filtered_movies, only: %i[index]

  def index
    render_json_movies(@movies)
  end

  def show
    @movie = Movie.find(params[:id])
    render_json_movies(@movie)
  end

  private

  def render_json_movies(param)
    render json: param, include: [
      :rating,
      { team: {
        include: %i[
          producer
          actor
        ]
      } }
    ]
  end

  def show_filtered_movies
    return @movies = Movie.all if params[:field].nil? 
    @movies = Movie.movie_scope(params[:field], params[:search])
  end

  def split_url(url)
    splitted = url.split(%r{[/?&]})[4..]

    result = []
    i = 0
    while i < splitted.size - 1
      first_field = splitted[i].split('=')[0]
      first_search = splitted[i].split('=')[1]
      second_field = splitted[i + 1].split('=')[0]
      second_search = splitted[i + 1].split('=')[1]
      result << { first_field => first_search, second_field => second_search }
      i += 2
    end
    result
  end
end
