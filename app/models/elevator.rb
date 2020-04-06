require 'Send_SMS/SMS'

class Elevator < ApplicationRecord
    belongs_to :column

    after_save :send_sms

    def send_sms
        if (self.saved_change_to_status? && self.status == "intervention")
            sms = SendSms::Sms.new
            sms.send_sms(self.id, self.column.battery.building.id, self.status)
        end
    end         
end 

