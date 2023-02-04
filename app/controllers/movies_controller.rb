# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show update destroy]
  before_action :show_filtered_movies, only: :index
  
  #before_action :set_movie, :show_filtered_movies, exept: :index  #only: %i[show destroy update]
  
  def index
    render_json_movies(@movies)
  end

  def show
    render_json_movies(@movie)
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render :json => { message: "Movie successfully created" }, status: :ok
    else
      render :json => { errors: @movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render :json => { errors: @movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    render :json => { message: "Movie successfully deleted" }, status: :ok
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
    @movies = Movie.movie_scope(params[:field], params[:search]);
  end

  def split_url(url)
    splitted = url.split(/[\/?&]/)[4..]

    result = []
    i = 0
    while i < splitted.size - 1
      first_field = splitted[i].split('=')[0]
      first_search = splitted[i].split('=')[1]
      second_field = splitted[i + 1].split('=')[0]
      second_search = splitted[i + 1].split('=')[1]
      result << { first_field => first_search, second_field => second_search }
      i+=2
    end
    result
  end

  def movie_params
    params.require(:movie).permit(:release_date, :genre, :title, :description)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
