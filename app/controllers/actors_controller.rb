# frozen_string_literal: true

class ActorsController < ApplicationController
  def index
    @actors = Actor.all

    render json: @actors
  end
end
