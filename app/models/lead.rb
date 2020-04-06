class Lead < ApplicationRecord
    has_one_attached :attached_file
    after_save :create_lead_ticket
    has_one :customer
    def create_lead_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "#{self.full_name} from #{self.company_name}", 
            :comment => { 
                :value => "The contact #{self.full_name} 
                    from company #{self.company_name} 
                    can be reached at email  #{self.email} 
                    and at phone number #{self.phone}. 
                    #{self.department} has a project named #{self.project_name} which would require contribution from Rocket Elevators.
                    \n\n
                    Project Description
                    #{self.project_desc}\n\n
                    Attached Message: #{self.message}"
            }, 
            :requester => { 
                "name": self.full_name, 
                "email": self.email 
            },
            :priority => "normal",
            :type => "question"
            )
    end

    def add_file_to_dropbox
        puts self.customer.business_name
    
        list = self.list_of_folders_dropbox
    
        puts list
    
        verification = false
    
        #verify if the folder's name already exist
        list.each do |l|
          if l == self.customer.business_name
            verification = true
          end
        end
    
        #if the folder's name do not exist, add it
        if !verification
          self.add_folder_to_dropbox
        end
    
        begin
    
          puts "__Put file in folder here__"
    
          client = DropboxApi::Client.new("#{ENV["Dropbox_token"]}")
          content = self.file_attachment
          busi_name = self.customer.business_name
          file_name = self.original_file_name
    
          require "date"
          currenttime = DateTime.now.strftime("%d-%m-%Y%H:%M:%S")
    
          client.upload("/#{busi_name}/#{businame}#{currenttime}#{file_name}", content)
          puts "__END Put file in folder here__"
    
          l = self
          l.file_attachment = nil
          l.save!
    
        rescue DropboxApi::Errors::UploadWriteFailedError => e
          p e.message
        end
    
      end
    
    
      def list_of_folders_dropbox
        client = DropboxApi::Client.new("#{ENV["Dropbox_token"]}")
        list_folder_result = client.list_folder('')
        entries = list_folder_result.entries
    
        folders = entries.select{|e| e.is_a?(DropboxApi::Metadata::Folder)}
        folders.collect!{|f_met| f_met.name}
      end
    
    
        def add_folder_to_dropbox
        client = DropboxApi::Client.new("#{ENV["Dropbox_token"]}")
    
        busi_name = self.customer.business_name
        # busiid = self.customer.id
    
            begin
            puts "ok__Create folder here__"
            client.create_folder("/#{businame}")
            puts "ok__END Create folder here__"
            rescue DropboxApi::Errors::FolderConflictError => e
            p e.message
            end 
    
        end
end