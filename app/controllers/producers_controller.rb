class ProducersController < ApplicationController
  def index
    @producers = Producer.all

    render json: @producers
  end
end
