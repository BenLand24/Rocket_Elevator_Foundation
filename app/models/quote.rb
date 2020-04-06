class Quote < ActiveRecord::Base

    after_save :create_quote_ticket

    def create_quote_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "#{self.Full_Name} from #{self.Company_Name}", 
            :comment => { 
                :value => "The contact #{self.Full_Name} from company #{self.Company_Name} 
                    can be reached at email #{self.Email} and at phone number #{self.Phone_Number}. 
                    Building type selected is #{self.Building_Type} with product line #{self.Product_Grade}. 
                    Number of suggested elevator is #{self.Nb_Ele_Suggested} and total price is #{self.Final_Price}. \n
                    For More Information, refers to Quote ##{self.id}."
            }, 
            :requester => { 
                "name": self.Full_Name, 
                "email": self.Email 
            },
            :priority => "normal",
            :type => "task"
            )
    end
end