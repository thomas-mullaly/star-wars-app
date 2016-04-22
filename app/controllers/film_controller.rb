require 'swapi_cache'
require 'vcr_setup'

class FilmController < ApplicationController
    def index
        @film = Tatooine::Film.get(params[:id])
        cache = SwapiCache.new

        @characters = cache.people.select { |character| character.films.include? @film.url }
    end
end
