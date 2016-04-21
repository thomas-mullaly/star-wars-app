class FilmController < ApplicationController
    def index
        @film = Tatooine::Film.get(params[:id])
    end
end
