ActiveAdmin.register Battery do
    belongs_to :building, polymorphic: true 
    # belongs_to :employee, polymorphic: true 
    permit_params :battery_type, :status, :date_commision, :date_last_inspect, :certificate_operations, :info, :notes, :building_id, :employee_id


    sidebar "Battery Details", only: [:show, :edit] do
        ul do
            li link_to "Columns", admin_battery_columns_path(resource)
        end
    end

    index do
        selectable_column
        id_column
        # column :customer_create_date
        column :battery_type
        column :status
        column :date_commision
        column :date_last_inspect
        column :certificate_operations
        column :info
        column :notes
        column :building_id
        column :employee_id
        actions
    end
  
    # filter :company_name
    filter :battery_type
    filter :status
    filter :building_id
    filter :employee_id

    form do |f|
        f.inputs do
            # f.input :customer_create_date
            f.input :battery_type
            f.input :status
            f.input :date_commision
            f.input :date_last_inspect
            f.input :certificate_operations
            f.input :info
            f.input :notes
            f.input :building_id
            f.input :employee_id
        end
        f.actions
    end
end