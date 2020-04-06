class LeadsController < ApplicationController

  def index
  end

  def new
    @lead = Lead.new 
  end

#SENDGRID
  require 'sendgrid-ruby'
  include SendGrid
  
  
  def create
    @lead = Lead.new(lead_params)
    puts "CREATING"
    p = params["lead"].permit!
    puts "PARAMS = #{p}"
    file_attachment = p["attached_file"]
    # file_attachment = params["attached_file"]
    if file_attachment != nil
      # p["attached_file"] = file_attachment.read
      p["original_file_name"] = file_attachment.original_filename
      puts "WRITING UPLOAD"
      File.open(Rails.root.join('public', file_attachment.original_filename), 'wb') do |file|
        file.write(file_attachment.read)
      end
    end
    #render json: @lead #test when submit button form
    if @lead.save
      flash[:notice] = "We received your request! "
      redirect_to :index

      data = JSON.parse(%Q[{
        "personalizations": [
          {
            "to": [
              {
                "email": "#{@lead.email}"
              }
            ],
            "dynamic_template_data":{
              "full_name":"#{@lead.full_name}",
              "project_name":"#{@lead.project_name}"
            },
            "subject": "Greetings from Team Rocket!"
          }
        ],
        "from": {
          "email": "Rocket@example.com"
        },
        "template_id":"d-4bffcf74a77e45ec9f8dd8006578c217"
      }])
      sg = SendGrid::API.new(api_key: ENV["SENDGRID_API"])
      response = sg.client.mail._("send").post(request_body: data)
    else
      flash[:notice] = "Request not succesfull."
      redirect_to action:"new"
    end
  end

  

  def edit
  end
  
  private
  def lead_params
    #params.require(name model)
    params.require(:lead).permit(:full_name,:company_name,:email,:phone,:project_name,:project_desc,:department,:message,:attached_file)
  end
end
