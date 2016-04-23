class SwapiCache
    BASE_URL = 'http://swapi.co/api/'

    @@people_cache = nil
    @@films_cache = nil

    def initialize
        @connection = Faraday.new BASE_URL do |faraday|
            faraday.request :url_encoded
            faraday.adapter Faraday.default_adapter
        end
    end

    def people
        @@people_cache = all "people" if @@people_cache.nil?

        @@people_cache
    end

    def films
        @@films_cache = all "films" if @@films_cache.nil?

        @@films_cache
    end

    def film(id)
        films.find { |f| f.url == "#{BASE_URL}films/#{id}/" }
    end

    private
    def get(url)
        JSON.parse @connection.get(url).body, object_class: OpenStruct
    end

    def all(resource)
        response = get "#{resource}/"

        result = response.results.map { |r| OpenStruct.new r }

        until response.next.blank? do
            response = get response.next

            result.concat response.results.map { |r| OpenStruct.new r }
        end

        result
    end
end
