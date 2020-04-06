ActiveAdmin.register_page "Dashboard" do
   menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

   content title: proc { I18n.t("active_admin.dashboard") } do

#     panel "contact requests" do
#  #     column_chart Lead.group_by_month(:created_at).count
#     end
#     panel "bid solicitations" do
#   #    column_chart Quote.group_by_month(:created_at).count
#     end
#     panel "elevators per customer" do
#     #   column_chart Elevator.group()
#     end

   end # content
 end
