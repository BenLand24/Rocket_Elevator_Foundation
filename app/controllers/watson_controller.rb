class WatsonController < ApplicationController

    require "ibm_watson/authenticators"
    require "ibm_watson/text_to_speech_v1"
    include IBMWatson

    def welcome
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
            apikey: ENV["Watson_Key"]
        )
        text_to_speech = TextToSpeechV1.new(
            authenticator: authenticator
        )
        text_to_speech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/565cdf45-d8b6-4705-ae30-f9795576293e"

        name = "#{current_employee.first_name} #{current_employee.last_name}"
        total_elevators = Elevator.count
        total_buildings = Building.count
        total_customers = Customer.count
        out_of_service = Elevator.where.not(status:'active').count
        total_quotes = Quote.count
        total_leads = Lead.count
        total_batteries = Battery.count
        total_cities = Address.distinct.count(:city)

        File.open("app/assets/audio/welcome.wav", "wb") do |audio|
            response = text_to_speech.synthesize(
                text: "Welcome, #{name}. You have #{total_elevators.to_s} elevators deployed in #{total_buildings.to_s} building belonging to #{total_customers.to_s} customers. Currently there are #{out_of_service.to_s} elevators out of service and #{total_quotes.to_s} quotes waiting to be processed. There are also #{total_leads.to_s} leads waiting and #{total_batteries.to_s} batteries running across #{total_cities.to_s} cities",
                accept: "audio/wav",
                voice: "en-GB_KateVoice"
            )
            audio.write(response.result)
            redirect_back(fallback_location:"/")
        end
    end
end