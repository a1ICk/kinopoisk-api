# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show update destroy]
  before_action :show_filtered_movies, only: :index

  # before_action :set_movie, :show_filtered_movies, exept: :index  #only: %i[show destroy update]

  def index
    render json: Movie.all, each_serializer: MovieSerializer, include: ['team', 'rating', 'team.producer', 'team.actor']
  end

  def show
    render json: @movie, each_serializer: MovieSerializer, include: ['team', 'rating', 'team.producer', 'team.actor']
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: { message: 'Movie successfully created' }, status: :ok
    else
      render json: { errors: @movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie, each_serializer: MovieSerializer, include: []
    else
      render json: { errors: @movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    render json: { message: 'Movie successfully deleted' }, status: :ok
  end

  def random
    @mv = Movie.all
    @movie = @mv[rand(0..@mv.length)]
    render json: @movie, each_serializer: MovieSerializer, include:
  end

  private

  def show_filtered_movies
    @movies = Movie.all
    @movies.movie_scope(params[:field], params[:search]) if params[:field].present?
  end

  def movie_params
    params.require(:movie).permit(:release_date, :genre, :title, :description)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
