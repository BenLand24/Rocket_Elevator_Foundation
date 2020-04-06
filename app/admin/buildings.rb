ActiveAdmin.register Building do
    belongs_to :customer, polymorphic: true 
    permit_params :admin_full_name, :admin_email, :admin_phone, :tech_full_name, :tech_email, :tech_phone, :customer_id, :address_id
    
    sidebar "Building Details", only: [:show, :edit] do
        ul do
            li link_to "Batteries", admin_building_batteries_path(resource)
            li link_to "Building Details", admin_building_building_details_path(resource)
        end
    end

    index do
        selectable_column
        id_column
        # column :customer_create_date
        column :admin_full_name
        column :admin_email
        column :admin_phone
        column :tech_full_name
        column :tech_email
        column :tech_phone
        column :customer_id
        column :address_id
        actions
    end
  
    filter :admin_full_name
    filter :tech_full_name

    form do |f|
        f.inputs do
            # f.input :customer_create_date
            f.input :admin_full_name
            f.input :admin_email
            f.input :admin_phone
            f.input :tech_full_name
            f.input :tech_email
            f.input :tech_phone
            f.input :customer_id
            f.input :address_id
        end
        f.actions
    end
end