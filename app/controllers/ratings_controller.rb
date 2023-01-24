class RatingsController < ApplicationController
  def index
    @ratings = Rating.all

    render json: @ratings
  end
end
