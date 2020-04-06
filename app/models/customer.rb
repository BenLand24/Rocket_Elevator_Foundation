class Customer < ApplicationRecord
    belongs_to :address
    belongs_to :user, optional: true
    has_many :buildings
    after_create :upload_lead_files

    def upload_lead_files
        dropbox_client = DropboxApi::Client.new('Dropbox_token')
        lead = Lead.find_by_email(self.contact_email)
       
        puts lead.email
        puts 'upload_lead_files is working'

        if lead.email == self.contact_email
            puts 'Found email of the same name!!!'
            #creates client folder in dropbox
                #new_client_folder = self.name_company_contact
            dropbox_client.create_folder("/#{self.name_company_contact}")

            puts "Folder created for #{self.name_company_contact}!!!"

            #find lead attached_file and put it in drop box
            dropbox_client.upload("/#{self.name_company_contact}/#{lead.attached_file}", lead.attached_file)

            #check if the upload to dropbox is successful...
            puts "successfully uploaded!"

            #destroy lead attachment file
            
        else 
            puts "Customer is not found in the Leads Table"
        end
    end
end