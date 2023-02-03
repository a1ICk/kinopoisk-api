# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :show_filtered_movies, only: %i[index]

  def index
    render_json_movies(@movies)
  end

  def show
    @movie = Movie.find(params[:id])
    render_json_movies(@movie)
  end

  private

  def render_json_movies(param)
    render json: param, include: [
      :rating,
      { team: {
        include: %i[
          producer
          actor
        ]
      } }
    ]
  end

  def show_filtered_movies
    @movies = Movie.all
    url = request.original_url # re-do: Dima
    parameters = split_url(url)
    if url.split('movies').size != 1
      if url.count('&') > 2
        parameters.each do |parameter|
          next if parameter.key?('sortField')

          @movies = if parameter['field'].include?('rating')
                      @movies.rating_scope(parameter['field'].split('.')[1], parameter['search'])
                    else
                      @movies.movie_scope(parameter['field'], parameter['search'])
                    end
        end
      elsif !url.include?('sort')
        @movies = if url.include?('rating')
                    @movies.rating_scope(parameters[0]['field'].split('.')[1], parameters[0]['search'])
                  else
                    @movies.movie_scope(parameters[0]['field'], parameters[0]['search'])
                  end
      end
    else
      @movies = Movie.all
    end
    return unless url.include?('sortField')

    @movies = @movies.movie_order_scope(parameters[-1]['sortField'])
    return unless parameters[-1]['sortType'] == '-1'

    @movies = @movies.reverse_order
  end

  def split_url(url)
    splitted = url.split(%r{[/?&]})[4..]

    result = []
    i = 0
    while i < splitted.size - 1
      first_field = splitted[i].split('=')[0]
      first_search = splitted[i].split('=')[1]
      second_field = splitted[i + 1].split('=')[0]
      second_search = splitted[i + 1].split('=')[1]
      result << { first_field => first_search, second_field => second_search }
      i += 2
    end
    result
  end
end
