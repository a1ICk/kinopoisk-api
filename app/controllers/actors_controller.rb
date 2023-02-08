# frozen_string_literal: true

class ActorsController < ApplicationController
  before_action :set_actor, only: %i[show destroy update]
  def index
    render json: Actor.all, each_serializer: ActorSerializer
  end

  def show
    render json: @actor, each_serializer: ActorSerializer
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      render :json => { message: "Actor successfully created" }, each_serializer: ActorSerializer, status: :ok
    else
      render :json => { errors: @actor.errors.full_messages }, each_serializer: ActorSerializer, status: :unprocessable_entity
    end
  end

  def update
    if @actor.update(actor_params)
      render json: @actor
    else
      render :json => { errors: @actor.errors.full_messages }, each_serializer: ActorSerializer, status: :unprocessable_entity
    end
  end

  def destroy
    @actor.destroy

    render :json => { message: "Actor successfully deleted" }, each_serializer: ActorSerializer, status: :ok
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name, :count_of_films, :team_id)
  end
end
