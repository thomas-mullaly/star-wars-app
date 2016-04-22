require 'swapi_cache'

class FilmController < ApplicationController
    def index
        @film = Tatooine::Film.get(params[:id])
        cache = SwapiCache.new

        @characters = cache.people.select { |character| character.films.include? @film.url }
    end
end
