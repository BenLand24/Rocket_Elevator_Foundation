ActiveAdmin.register Employee do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation

  # sidebar "Employee Details", only: [:show, :edit] do
  #   ul do
  #       li link_to "Battery", admin_employee_batteries_path(resource)
  #   end
  # end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :title
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :title
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
