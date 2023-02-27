# frozen_string_literal: true

class RatingsController < ApplicationController
  before_action :current_rating, only: %i[show update]
  def index
    authorize Rating
    @ratings = Rating.all
    render json: @ratings
  end

  def show
    authorize @rating
    render json: @rating
  end

  def create
    @rating = Rating.new(rating_params)
    authorize @rating
    if @actor.save
      render json: { message: 'Rating created' }, status: :created
    else
      render json: { errors: @rating.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @rating
    if @rating.update(rating_params)
      render json: @rating
    else
      render json: { errors: @rating.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def current_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:kp, :imdb, :movie_id)
  end
end
