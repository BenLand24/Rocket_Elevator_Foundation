class InterventionsController < ApplicationController
  # before_action :authenticate_user!

  def new
      @clients = Customer.order(:company_name)
      puts @clients.collect{ |c| c.company_name }

      @employee = Employee.order(:last_name)
      puts @employee.collect{ |e| e.first_name + e.last_name }
  end

  def get_buildings_for_client
      id_client = params[:client_id]
      @buildings = Building.where(customer_id: id_client)
      render json: @buildings
  end    
  
  def get_batteries_for_building
      id_building = params[:building_id]
      @batteries = Battery.where(building_id: id_building)
      render json: @batteries
  end

  def get_columns_for_battery
      @columns = Column.where(battery_id: params[:battery_id])
      render json: @columns
  end

  def get_elevators_for_column
      @elevators = Elevator.where(column_id: params[:column_id])
      render json: @elevators
  end 


  def create_intervention
      params["intervention"].delete("column_id") if params["intervention"]["column_id"] == "Nil"
      params["intervention"].delete("elevator_id") if params["intervention"]["elevator_id"] == "Nil"
      attributes = params[:intervention].permit!

      attributes[:author_id] = current_user.employee.id 
      
      intervention = Intervention.new(attributes)
      intervention.save!

      intervention_ticket(intervention)
  end 

  def intervention_ticket(intervention)

      comment = { :value => "Intervention ticket author: #{current_user.first_name} #{current_user.last_name}
      \n \n Client: #{intervention.customer.company_name} 
      \n \n Building #: #{intervention.building.id}   (#{intervention.building.company_name})
      \n \n Battery #: #{intervention.battery.id} 
      \n \n Column #: #{intervention.column ? intervention.column.id : "N/Ap"} 
      \n \n Elevator shaft #: #{intervention.elevator ? intervention.elevator.id : "N/Ap"} 
      \n \n Intervention assigned to: #{intervention.employee ? intervention.employee.first_name : "None"} #{intervention.employee ? intervention.employee.last_name : ""} 
      \n \n Intervention description: \n #{intervention.report} "}

      ticket = ZendeskAPI::Ticket.new($client, :type => "support", :priority => "urgent",
      :subject => "Intervention ticket for the #{intervention.customer.company_name} building",
      :comment => comment
      )

      ticket.save!
  end

end