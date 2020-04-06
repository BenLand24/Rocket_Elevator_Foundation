ActiveAdmin.register Address do
    permit_params :type_of_address, :status, :entity, :number_n_street, :suite_or_apt, :city, :postal_code, :country, :notes
  
    sidebar "Address Details", only: [:show, :edit] do
        ul do
            # li link_to "Buildings", admin_address_buildings_path(resource)
            li link_to "Customers", admin_address_customers_path(resource)
        end
    end

    index do
        selectable_column
        id_column
        column :type_of_address
        column :status
        column :entity
        column :number_n_street
        column :suite_or_apt
        column :city
        column :postal_code
        column :country
        column :notes
        actions
    end
  
    filter :type_of_address
    filter :number_n_street
    filter :city

    form do |f|
        f.inputs do
            f.input :type_of_address
            f.input :status
            f.input :entity
            f.input :number_n_street
            f.input :suite_or_apt
            f.input :city
            f.input :postal_code
            f.input :country
            f.input :notes
        end
        f.actions
    end
end

  