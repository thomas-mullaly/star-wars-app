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
        if @@people_cache == nil then
            res = get("people/")

            @@people_cache = res.results.map { |c| OpenStruct.new c }

            until res.next.blank? do
                res = get res.next

                @@people_cache.concat res.results.map { |c| OpenStruct.new c }
            end
        end

        @@people_cache
    end

    def films
        if @@films_cache == nil then
            res = get("films/")

            @@films_cache = res.results.map { |f| OpenStruct.new f }

            until res.next.blank? do
                res = get res.next

                @@films_cache.concat res.results.map { |f| OpenStruct.new f }
            end
        end

        @@films_cache
    end

    def film(id)
        films.find { |f| f.url == "#{BASE_URL}films/#{id}/" }
    end

    def get(url)
        JSON.parse @connection.get(url).body, object_class: OpenStruct
    end
end
