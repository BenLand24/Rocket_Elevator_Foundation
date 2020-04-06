ActiveAdmin.register BuildingDetail do
    belongs_to :building, polymorphic: true 
    permit_params :info_key, :value

    index do
        selectable_column
        id_column
        # column :customer_create_date
        column :info_key
        column :value
        column :building_id
        actions
    end
  
    # filter :company_name
    filter :building_id

    form do |f|
        f.inputs do
            # f.input :customer_create_date
            f.input :info_key
            f.input :value
        end
        f.actions
    end
end