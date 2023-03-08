# frozen_string_literal: true

class ProducersController < ApplicationController
  before_action only: %i[show create update destroy]

  def index
    authorize Producer
    render json: Producer.all, each_serializer: ProducerSerializer
  end

  def show
    authorize @producer
    render json: @producer, each_serializer: ProducerSerializer
  end

  def create
    @producers = Producer.new(producers_params)
    authorize @producer
    if @producers.save
      render json: { message: 'Producer successfully created' }, status: :ok
    else
      render json: { errors: @producers.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @producer = Producer.find(params[:id])
    authorize @producer
    if @producer.update(producers_params)
      render_json_producers(@producer)
    else
      render json: { errors: @actor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def producers_params
    params.require(:producer).permit(:name, :experience, :team_id)
  end
end
