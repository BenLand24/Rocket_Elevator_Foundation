ActiveAdmin.register Customer do
  belongs_to :address, polymorphic: true 
  permit_params :customer_create_date, :company_name, :name_company_contact, :company_phone, :contact_email, :company_desc, :full_name_STA, :tech_authority_phone, :tech_manager_email, :address_id

  sidebar "Customer Details", only: [:show, :edit] do
    ul do
      li link_to "Buildings", admin_customer_buildings_path(resource)
    end
  end

  index do
      selectable_column
      id_column
      column :customer_create_date
      column :company_name
      column :name_company_contact
      column :company_phone
      column :contact_email
      column :company_desc
      column :full_name_STA
      column :tech_authority_phone
      column :tech_manager_email
      column :address_id
      actions
  end

  filter :company_name
  filter :name_company_contact
  filter :full_name_STA

  form do |f|
      f.inputs do
          f.input :customer_create_date
          f.input :company_name
          f.input :name_company_contact
          f.input :company_phone
          f.input :contact_email
          f.input :company_desc
          f.input :full_name_STA
          f.input :tech_authority_phone
          f.input :tech_manager_email
          f.input :address_id
      end
      f.actions
  end
end