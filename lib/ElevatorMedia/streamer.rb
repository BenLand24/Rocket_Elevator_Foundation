require 'http'
require 'json'

module ElevatorMedia
    class Streamer
        def initialize
        end
        def self.test
            "Hello World"
        end
        def self.getContent
           getTime=HTTP.get("http://worldtimeapi.org/api/ip").to_s
           obj = JSON.parse(getTime)['datetime']
           html = "<div>#{obj}</div>"
           puts html
           return html 
        end
        def self.getJoke
            jokes = HTTP.get("https://sv443.net/jokeapi/v2/joke/Miscellaneous?blacklistFlags=religious,racist,sexist")
            response = JSON.parse(jokes)['setup']
            punchline = JSON.parse(jokes)['delivery']
            html = "<div>#{response} <br> #{punchline}</div>"
            puts html
            return html
        end
    end
end

