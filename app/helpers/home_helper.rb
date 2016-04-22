module HomeHelper
    def parse_film_id(filmUrl)
        URI(filmUrl).path.split('/').last
    end
end
