# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Employee.create!(first_name: 'admin', last_name: 'istrator', title: 'A', email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Employee.create!(first_name: 'admin', last_name: 'istrator', title: 'A', email: 'admin@example.com', password: 'password', password_confirmation: 'password')
jack = Employee.create!(first_name: 'jackie', last_name: 'lai', title: 'B', email: 'jack@q', password: 'testing', password_confirmation: 'testing') 
Employee.create!(first_name: '123', last_name: '321', title: '0', email: '123@123', password: '123123', password_confirmation: '123123') 

Employee.create!(first_name: 'mathieu', last_name: 'houde', title: 'engineer', email: 'mathieu.houde@codeboxx.biz', password: '123456', password_confirmation: '123456') 
Employee.create!(first_name: 'patrick', last_name: 'thibault', title: 'coach', email: 'tiboclan@gmail.com', password: '123456', password_confirmation: '123456') 
Employee.create!(first_name: 'philippe', last_name: 'motillon', title: 'coach', email: 'philippe.motillon@keyrus.ca', password: '123456', password_confirmation: '123456') 
Employee.create!(first_name: 'khalid', last_name: 'djado', title: 'coach', email: 'kdjado@gmail.com', password: '123456', password_confirmation: '123456') 
Employee.create!(first_name: 'antoine', last_name: 'deblonde', title: 'coach', email: 'antoine.deblonde@keyrus.ca', password: '123456', password_confirmation: '123456') 
Employee.create!(first_name: 'ibrahim', last_name: 'mahamane', title: 'coach', email: 'imahamaneissa@gmail.com', password: '123456', password_confirmation: '123456') 



require 'faker'
require 'date'

15.times do |n|
    nameF = Faker::Name.name
    businessF = Faker::Company.name
    emailF = Faker::Internet.email
    phoneF = Faker::PhoneNumber.phone_number
    projname = Faker::Lorem.words(number: 3, supplemental: true)
    descriptionF = Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 3)
    departmentF = ["Question","Corporate","Residential"].sample
    informationF = Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 3)
    yearF = rand(2017..2019)
    monthF = rand(1..12)
    if monthF == 2
        dayF = rand(1..28)
    else
        dayF = rand(1..30)
    end
    c = Date.new(yearF, monthF, dayF)
    c.strftime("%F")
    # fileF = ""

    Lead.create(
        full_name: nameF,
        company_name: businessF,
        email: emailF,
        phone: phoneF,
        project_name: projname,
        project_desc: descriptionF,
        department: departmentF,
        message: informationF,
        # attached_file: fileF,
        created_at: c,
        updated_at: c
    )

    r = rand(3)
    
    if r == 0
        building_type = "residential"
        product_grade = ["Standard","Premium","Excellium"].sample
        if product_grade == "Standard"
            price_per_elev = 7565
            fee = 0.1
        elsif product_grade == "Premium"
            price_per_elev = 12345
            fee = 0.13
        else
            price_per_elev = 15400
            fee = 0.16
        end
        x = rand(50..500)
        y = rand(2..45)
        z = rand(3)

        cages = rand(1..24)

        Quote.create(
            Full_Name: nameF,
            Company_Name: businessF,
            Email: emailF,
            Building_Type: building_type,
            Product_Grade: product_grade,
            Nb_Appartement: x,
            Nb_Floor: y,
            Nb_Basement: z,
            Nb_Ele_Suggested: cages,
            Price_Per_Ele: price_per_elev,
            Subtotal: cages * price_per_elev,
            Install_Fee: cages * price_per_elev * fee,
            Final_Price: cages * price_per_elev * (1+fee),
            created_at: c,
            updated_at: c
        )
    elsif r == 1
        building_type = "commercial"
        product_grade = ["Standard","Premium","Excellium"].sample
        if product_grade == "Standard"
            price_per_elev = 7565
            fee = 0.1
        elsif product_grade == "Premium"
            price_per_elev = 12345
            fee = 0.13
        else
            price_per_elev = 15400
            fee = 0.16
        end
        x = rand(50..500)
        y = rand(2..45)
        z = rand(3)

        cages = rand(1..24)

        Quote.create(
            Full_Name: nameF,
            Company_Name: businessF,
            Email: emailF,
            Building_Type: building_type,
            Product_Grade: product_grade,
            Nb_Business: x,
            Nb_Floor: y,
            Nb_Basement: z,
            Nb_Cage: cages,
            Nb_Parking: x,
            Nb_Ele_Suggested: cages,
            Price_Per_Ele: price_per_elev,
            Subtotal: cages * price_per_elev,
            Install_Fee: cages * price_per_elev * fee,
            Final_Price: cages * price_per_elev * (1+fee),
            created_at: c,
            updated_at: c
        )
    elsif r == 2
        building_type = "corporate"
        product_grade = ["Standard", "Premium", "Excellium"].sample
        if product_grade == "Standard"
            price_per_elev = 7565
            fee = 0.1
        elsif product_grade == "Premium"
            price_per_elev = 12345
            fee = 0.13
        else
            price_per_elev = 15400
            fee = 0.16
        end
        x = rand(50..500)
        y = rand(2..45)
        z = rand(3)

        cages = rand(1..24)

        Quote.create(
            Full_Name: nameF,
            Company_Name: businessF,
            Email: emailF,
            Building_Type: building_type,
            Product_Grade: product_grade,
            Nb_Company: x,
            Nb_Floor: y,
            Nb_Basement: z,
            Nb_Parking: x,
            Nb_OccupantPerFloor: rand(300..500),
            Nb_Ele_Suggested: cages,
            Price_Per_Ele: price_per_elev,
            Subtotal: cages * price_per_elev,
            Install_Fee: cages * price_per_elev * fee,
            Final_Price: cages * price_per_elev * (1+fee),
            created_at: c,
            updated_at: c
        )
    else
        building_type = "hybrid"
        product_grade = ["Standard","Premium","Excellium"].sample
        if product_grade == "Standard"
            price_per_elev = 7565
            fee = 0.1
        elsif product_grade == "Premium"
            price_per_elev = 12345
            fee = 0.13
        else
            price_per_elev = 15400
            fee = 0.16
        end
        x = rand(50..500)
        y = rand(2..45)
        z = rand(3)

        cages = rand(1..24)

        Quote.create(
            Full_Name: nameF,
            Company_Name: businessF,
            Email: emailF,
            Building_Type: building_type,
            Product_Grade: product_grade,
            Nb_Business: x,
            Nb_Floor: y,
            Nb_Basement: z,
            Nb_Parking: x,
            Nb_OccupantPerFloor: rand(300..500),
            Nb_OperatingHour: rand(1..24),
            Nb_Ele_Suggested: cages,
            Price_Per_Ele: price_per_elev,
            Subtotal: cages * price_per_elev,
            Install_Fee: cages * price_per_elev * fee,
            Final_Price: cages * price_per_elev * (1+fee),
            created_at: c,
            updated_at: c
        )
    end
end

50.times do |n|

    typeF = ["Billing", "Shipping", "Home", "Business"].sample
    statusF = ["active", "inactive"].sample
    entityF = "customer"
    addrF = Faker::Address.street_address
    secondary_addressF = Faker::Address.secondary_address
    cityF = Faker::Address.city
    postalF = Faker::Address.zip
    notesF = Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 5)
    latF = rand(35.0..55.0)
    longF = rand(-120.0..-77.0)

    fake_address = Address.create!(
        type_of_address: typeF,
        status: statusF,
        entity: entityF,
        number_n_street: addrF,
        suite_or_apt: secondary_addressF,
        city: cityF,
        postal_code: postalF,
        country: "US",
        notes: notesF,
        lat: latF,
        long: longF
    )

    nameF = Faker::Name.name
    unique_businessF = Faker::Company.name
    phoneF = Faker::PhoneNumber.phone_number
    emailF = Faker::Internet.email
    yearF = rand(2017..2019)
    monthF = rand(1..12)
    if monthF == 2
        dayF = rand(1..28)
    else
        dayF = rand(1..30)
    end
    c = Date.new(yearF, monthF, dayF)
    c.strftime("%F")

    fake_customer = Customer.create!(
        customer_create_date: c,
        company_name: unique_businessF,
        address_id: fake_address.id,
        name_company_contact: nameF,
        company_phone: phoneF,
        contact_email: emailF,
        company_desc: notesF,
        full_name_STA: nameF,
        tech_authority_phone: phoneF,
        tech_manager_email: emailF,
        # created_at: c,
        # updated_at: c
    )
    additional_building = rand(1..3)
    additional_building.times do |x|
        if x > 0
            typeF = ["Billing", "Shipping", "Home", "Business"].sample
            statusF = ["active", "inactive"].sample
            entityF = "building"
            addrF = Faker::Address.street_address
            secondary_addressF = Faker::Address.secondary_address
            cityF = Faker::Address.city
            postalF = Faker::Address.zip
            notesF = Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 5)
            latF = rand(35.0..55.0)
            longF = rand(-120.0..-77.0)
            
            fake_address = Address.create!(
                type_of_address: typeF,
                status: statusF,
                entity: entityF,
                number_n_street: addrF,
                suite_or_apt: secondary_addressF,
                city: cityF,
                postal_code: postalF,
                country: "US",
                notes: notesF,
                lat: latF,
                long: longF
            )
        end

        fake_building  = Building.create!(
            customer_id:  fake_customer.id,
            address_id: fake_address.id,
            admin_full_name: nameF,
            admin_email: emailF,
            admin_phone: phoneF,
            tech_full_name: nameF,
            tech_email: emailF,
            tech_phone: phoneF,
        )
        buildingtypeF = ["Residential","Commercial","Corporate","Hybrid"].sample
        BuildingDetail.create!(
            building_id:  fake_building.id,
            info_key: "Type",
            value: buildingtypeF
        )

        
        certificateF = Faker::IDNumber.valid
        notesF = Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 3)

        fake_battery = Battery.create!(
            building_id: fake_building.id,
            battery_type: buildingtypeF,
            status: ["active","inactive","intervention"].sample,
            employee_id: rand(1..9),
            date_commision: c,
            date_last_inspect: c,
            certificate_operations: certificateF,
            info: notesF,
            notes: notesF,
            # created_at: c,
            # updated_at: c
        )
        floorsF = rand(2..20)
        rand(1..5).times do |n|
            fake_column = Column.create!(
                battery_id: fake_battery.id,
                column_type: buildingtypeF,
                number_floors: floorsF,
                status: ["active","inactive","intervention"].sample,
                info: notesF,
                notes: notesF
            )
            modelF = ["Standard","Premium","Excellium"].sample
            rand(1..6).times do |n|
                certificateF = Faker::IDNumber.valid
                Elevator.create!(
                    column_id:  fake_column.id,
                    serial_number: Faker::IDNumber.south_african_id_number,
                    model: modelF,
                    elevator_type: buildingtypeF,
                    status: ["active","inactive","intervention"].sample,
                    date_commision: c,
                    date_last_inspect: c,
                    certificate_inspect: certificateF,
                    info: notesF,
                    notes: notesF,
                    # created_at: c,
                    # created_at: c
                )
            end
        end
    end
end