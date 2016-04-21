class HomeController < ApplicationController
  def index
      @films = Tatooine::Film.list.sort_by { |film| film.episode_id }
  end
end
