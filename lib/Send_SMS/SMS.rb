require 'twilio-ruby'
require 'json'
require 'http'

module SendSms
    class Sms 
        def initialize
        end
        
        def send_sms(ele_id, building_id, new_status)
            account_sid = ENV['TWILIO_ACCOUNT_SID']
            auth_token = ENV['TWILIO_AUTH_TOKEN']
            client = Twilio::REST::Client.new(account_sid, auth_token)
            
            from = ENV['TWILIO_PHONE_NUMBER']
            to = ENV['TWILIO_PHONE_NUMBER_TO']
            puts "sending msg"
            client.messages.create(
                from: from,
                to: to,
                body: "Hello technician, Patrick Thibault. 
                The elevator##{ele_id} in building##{building_id} is in need of your service.
                It's current status has been set to #{new_status}."
            )
            puts "msg sent?"
        end
    end
end
