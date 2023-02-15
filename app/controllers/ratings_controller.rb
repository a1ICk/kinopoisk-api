# frozen_string_literal: true

class RatingsController < ApplicationController
  before_action :current_rating, only: %i[show update]
  def index
    @ratings = Rating.all
    render json: @ratings, each_serializer: RatingSerializer
  end

  def show
    render json: @rating, each_serializer: RatingSerializer
  end

  def create 
    @rating = Rating.new(rating_params)
    if @actor.save
      render :json => {message: "Rating created"}, status: :created, each_serializer: RatingSerializer
    else
      render :json => {errors: @rating.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update 
    if @rating.update(rating_params)
      render json: @rating, each_serializer: RatingSerializer
    else
      render :json => {errors: @rating.errors.full_messages}, status: :unprocessable_entity
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
