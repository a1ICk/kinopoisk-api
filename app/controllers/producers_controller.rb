# frozen_string_literal: true

class ProducersController < ApplicationController
  before_action only: %i[show create update destroy]

  def index
    render json: Producer.all, each_serializer: ProducerSerializer
  end

  def show
    render json: @producer, each_serializer: ProducerSerializer
  end


  def create
    @producers = Producer.new(producers_params)
    if @producers.save
      render json: { message: 'Producer successfully created' }, each_serializer: ProducerSerializer, status: :ok
    else
      render json: { errors: @producers.errors.full_messages }, each_serializer: ProducerSerializer, status: :unprocessable_entity
    end
  end

  def show
    @producers = Producer.find(params[:id])
    render_json_producers(@producers)
  end

  def update
    @producers = Producer.find(params[:id])
    if @producers.update(producers_params)
      render_json_producers(@producers)
    else
      render json: { errors: @actor.errors.full_messages }, each_serializer: ProducerSerializer, status: :unprocessable_entity
    end
  end

  def destroy
    @producers.destroy

    render :json => { message: "Producers successfully deleted" }, each_serializer: ProducerSerializer, status: :ok
  end

  def render_json_producers(param)
    render json: param, each_serializer: ProducerSerializer
  end

  def producers_params
    params.require(:producer).permit(:name, :experience, :team_id)
  end
end
