require 'pg'
require 'faker'
require 'date'


namespace :transfer do
    desc "export to postgresql"
    task data: :environment do
        connected = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: "5432", dbname:"Joshua_Knutson", user: "codeboxx", password: "Codeboxx1!")
        
        # prepares all the queries
        connected.prepare('to_fact_contacts', "INSERT INTO \"fact_contacts\" (date_created, company_name, email, project_name) VALUES ($1,$2,$3,$4)")
        connected.prepare('to_fact_quotes', "INSERT INTO \"fact_quotes\" (date_created, company_name, email, nbelevs) VALUES ($1,$2,$3,$4)")
        connected.prepare('to_fact_elevators', "INSERT INTO \"fact_elevators\" (serial_number, commissioning_date, building_id, customer_id, city) VALUES ($1,$2,$3,$4,$5)")
        connected.prepare('to_dim_customers', "INSERT INTO \"dim_customers\" (date_created, company_name, contact_name, contact_email, nbelevs, customer_city) VALUES ($1,$2,$3,$4,$5,$6)")
        connected.prepare('to_fact_intervention',"INSERT INTO \"fact_intervention\" (employee_id, building_id, battery_id, column_id, elevator_id, date_started, date_ended, result, status) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)")

        # resets fact_contacts table and re-import values
        connected.exec ("TRUNCATE fact_contacts RESTART IDENTITY")
        Lead.all.each do |lead|
            connected.exec_prepared('to_fact_contacts',[lead.created_at, lead.company_name, lead.email, lead.project_name])
        end
    
        # resets fact_quotes table and re-import values
        connected.exec ("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |quote|
            connected.exec_prepared('to_fact_quotes', [quote.created_at, quote.Company_Name, quote.Email, quote.Nb_Cage])
        end

        # resets fact_elevators table and re-import values
        connected.exec ("TRUNCATE fact_elevators RESTART IDENTITY")
        Elevator.all.each do |elevator|
            connected.exec_prepared('to_fact_elevators', [elevator.serial_number, elevator.date_commision, elevator.column.battery.building_id, elevator.column.battery.building.customer_id, elevator.column.battery.building.address.city])
        end

        # resets dim_customers table and re-import values
        connected.exec("TRUNCATE dim_customers RESTART IDENTITY")
        Customer.all.each do |customer|
            nb_elevators = 0
            customer.buildings.all.each do |building|
                building.batteries.all.each do |battery|
                    battery.columns.all.each do |column|
                        nb_elevators += column.elevators.count
                    end
                end
            end
            connected.exec_prepared('to_dim_customers', [customer.created_at, customer.company_name, customer.name_company_contact, customer.contact_email, nb_elevators, customer.address.city])
        end

        # resets fact_intervention table and re-import values
        connected.exec("TRUNCATE fact_intervention RESTART IDENTITY")
        Building.all.each do |building|            
            building.batteries.all.each do |battery|
                if (battery.status == "intervention")
                    yearF = rand(2017..2019)
                    monthF = rand(1..12)
                    if monthF == 2
                        dayF = rand(1..26)
                    else
                        dayF = rand(1..28)
                    end
                    status = ["Pending","InProgress","Interrupted","Resumed","Complete"].sample
                    date_s = Date.new(yearF, monthF, dayF)
                    if (status == "Complete")
                        result = ["Success","Failure"].sample
                        date_e = Date.new(yearF, monthF, dayF+2)
                        if (result == "Failure")
                            battery.update(status: "inactive")
                        else
                            battery.update(status: "active")
                        end
                    else
                        result = "Incomplete"
                        date_e = nil
                    end
                    connected.exec_prepared('to_fact_intervention', [battery.employee_id, building.id, battery.id, nil, nil, date_s, date_e, result, status])
                end
                battery.columns.all.each do |column|
                    if (column.status == "intervention")
                        yearF = rand(2017..2019)
                        monthF = rand(1..12)
                        if monthF == 2
                            dayF = rand(1..26)
                        else
                            dayF = rand(1..28)
                        end
                        status = ["Pending","InProgress","Interrupted","Resumed","Complete"].sample
                        date_s = Date.new(yearF, monthF, dayF)
                        if (status == "Complete")
                            result = ["Success","Failure"].sample
                            date_e = Date.new(yearF, monthF, dayF+2)
                            if (result == "Failure")
                                column.update(status: "inactive")
                            else
                                column.update(status: "active")
                            end
                        else
                            result = "Incomplete"
                            date_e = nil
                        end
                        connected.exec_prepared('to_fact_intervention', [battery.employee_id, building.id, nil, column.id, nil, date_s, date_e, result, status])
                    end
                    column.elevators.all.each do |elevator|
                        if (elevator.status == "intervention")
                            yearF = rand(2017..2019)
                            monthF = rand(1..12)
                            if monthF == 2
                                dayF = rand(1..26)
                            else
                                dayF = rand(1..28)
                            end
                            status = ["Pending","InProgress","Interrupted","Resumed","Complete"].sample
                            date_s = Date.new(yearF, monthF, dayF)
                            if (status == "Complete")
                                result = ["Success","Failure"].sample
                                date_e = Date.new(yearF, monthF, dayF+2)
                                if (result == "Failure")
                                    elevator.update(status: "inactive")
                                else
                                    elevator.update(status: "active")
                                end
                            else
                                result = "Incomplete"
                                date_e = nil
                            end
                            connected.exec_prepared('to_fact_intervention', [battery.employee_id, building.id, nil, nil, elevator.id, date_s, date_e, result, status])
                        end
                    end
                end
            end
        end
    end




    desc "create my database"
    task init: :environment do
        puts "hi"
        connected = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: "5432", dbname: 'postgres', user: "codeboxx", password: "Codeboxx1!")
        puts connected
        connected.exec("CREATE DATABASE JackieLai")
    end

    desc "test"
    task data: :environment do
        #ici maria :)
    end
end








