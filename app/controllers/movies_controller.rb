class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    url = request.original_url
    parameters = split_url(url)
      if url.split('movies').size != 1
        if url.count('&') > 2
          parameters.each do |parameter|

              if !parameter.key?('sortField')
                if parameter['field'].include?('rating')
                  @movies = @movies.rating_scope(parameter['field'].split('.')[1], parameter['search'])
                else
                  @movies = @movies.movie_scope(parameter['field'], parameter['search'])
                end
              end

          end
        elsif !url.include?('sort')
          if url.include?('rating')
            @movies = @movies.rating_scope(parameters[0]['field'].split('.')[1], parameters[0]['search'])
          else
            @movies = @movies.movie_scope(parameters[0]['field'], parameters[0]['search'])
          end
        end
      else
        @movies = Movie.all
      end
      if url.include?('sortField')
        @movies = @movies.movie_order_scope(parameters[-1]['sortField'])
        if parameters[-1]['sortType'] == '-1'
          @movies = @movies.reverse_order
        end
      end


    render json: @movies, include: [
      :rating,
      { team: {
        include: %i[
          producer
          actor
        ]
      } }
    ]
  end

  private
  def split_url(url)
    splitted = url.split(/[\/?&]/)[4..]

    result = []
    i = 0
    while i < splitted.size - 1
      first_field = splitted[i].split('=')[0]
      first_search = splitted[i].split('=')[1]
      second_field = splitted[i + 1].split('=')[0]
      second_search = splitted[i + 1].split('=')[1]
      result << { first_field => first_search, second_field => second_search }
      i+=2
    end
    result
  end
end
