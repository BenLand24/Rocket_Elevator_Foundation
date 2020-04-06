ActiveAdmin.register Column do
    belongs_to :battery
    permit_params :column_type, :number_floors, :status, :info, :notes, :battery_id

    sidebar "Column Details", only: [:show, :edit] do
        ul do
            li link_to "Elevators", admin_column_elevators_path(resource)
        end
    end

    index do
        selectable_column
        id_column
        # column :customer_create_date
        column :column_type
        column :number_floors
        column :status
        column :info
        column :notes
        column :battery_id
        actions
    end
  
    # filter :company_name
    filter :column_type
    filter :number_floors
    filter :status

    form do |f|
        f.inputs do
            # f.input :customer_create_date
            f.input :column_type
            f.input :number_floors
            f.input :status
            f.input :info
            f.input :notes
            f.input :battery_id
        end
        f.actions
    end
end