require 'http'
require 'json'


ActiveAdmin.register Elevator do
    belongs_to :column, optional: true
    permit_params :serial_number, :model, :elevator_type, :status, :date_commision, :date_last_inspect, :certificate_inspect, :info, :notes, :column_id

    controller do
        def update
            @elevator = Elevator.find(params[:id])

            old_status = @elevator.status

            if @elevator.update(params.require(:elevator).permit(:serial_number, :model, :elevator_type, :status, :date_commision, :date_last_inspect, :certificate_inspect, :info, :notes, :column_id))
                if @elevator.status != old_status
                    text_to_send = "The Elevator %i with Serial Number %s changed status from %s to %s" % [@elevator.id, @elevator.serial_number, old_status, @elevator.status]
                    rc_slack = HTTP.post("https://slack.com/api/chat.postMessage", params:{
                        token: ENV['SLACK_API_TOKEN'],
                        channel: '#elevator_operations',
                        text: text_to_send,
                        as_user: true
                    })
                end
                redirect_to admin_elevator_path(@elevator.id)
            else
                render :edit
            end
        end
    end
    

    index do
        selectable_column
        id_column
        # column :customer_create_date
        column :serial_number
        column :model
        column :elevator_type
        column :status
        column :date_commision
        column :date_last_inspect
        column :certificate_inspect
        column :info
        column :notes
        column :column_id
        actions
    end
  
    # filter :company_name
    filter :model
    filter :elevator_type
    filter :status
    filter :column_id

    form do |f|
        f.inputs do
            # f.input :customer_create_date
            f.input :serial_number
            f.input :model
            f.input :elevator_type
            f.input :status, as: :select, collection: ['active', 'inactive', 'intervention'], include_blank: false
            f.input :date_commision
            f.input :date_last_inspect
            f.input :certificate_inspect
            f.input :info
            f.input :notes
            f.input :column_id
        end
        f.actions
    end
end