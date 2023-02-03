class ProducersController < ApplicationController
  before_action only: %i[show create update destroy]
  def index
    @producers = Producer.all
    render_json_producers(@producers)
  end

  def create
    @producers = Producer.new(producers_params)
    if @producers.save
      render json: { message: 'Producer successfully created' }, status: :ok
    else
      render json: { errors: @producers.errors.full_messages }, status: :unprocessable_entity
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
      render json: { errors: @actor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @producers = Producer.find(params[:id])
    return unless @producers.destroy

    render json: { message: 'Actor successfully deleted' }, status: :ok
  end

  def render_json_producers(param)
    render json: param
  end

  def producers_params
    params.require(:producer).permit(:name, :experience, :team_id)
  end
end
