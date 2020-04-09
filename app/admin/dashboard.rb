ActiveAdmin.register_page "Dashboard" do
   menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

   content title: proc { I18n.t("active_admin.dashboard") } do

    panel "watson" do
      span do
        button_to "Welcome", welcome_path, method: :get, id: "APIbtn"
      end
      span do
        audio_tag("welcome.wav", autoplay: true, controls: true)
      end
    end
    panel "google map" do
      render 'map'
    end
    panel "contact requests" do
      column_chart Lead.group_by_month(:created_at).count
    end
    panel "bid solicitations" do
      column_chart Quote.group_by_month(:created_at).count
    end
    panel "elevators per customer" do
    #   column_chart Elevator.group()
    end

   end # content
 end
