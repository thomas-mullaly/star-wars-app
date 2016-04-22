require 'swapi_cache'

class HomeController < ApplicationController
  def index
      cache = SwapiCache.new

      @films = cache.films.sort_by { |film| film.episode_id }
  end
end
