require 'swapi_cache'

class FilmController < ApplicationController
    def index
        cache = SwapiCache.new

        @film = cache.film params[:id]
        @characters = cache.people.select { |character| character.films.include? @film.url }
    end
end
