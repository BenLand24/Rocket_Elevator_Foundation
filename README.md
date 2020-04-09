# ROCKET ELEVATORS INFORMATION SYSTEM API'S

  Goal for the week : Implement different Api keys into our website Rocket Elevator.

###### New Update Week 7 | Odyssey :   March 27rd 2020 ######


## API Implemented 
  - Google API - Team Leader - Alberbecois

  - Twilio API - Collaborator - Amuriana

  - Slack API - Collaborator - Kamiwackii

  - Dropbox API - Collaborator - BenLand24

  - Sendgrid API - Collaborator - Cyborg00

  - IBM Watson API - Collaborator - Alberbecois

  - ZenDesk API - Collaborator - Kamiwackii


  ## SPECIAL INSTRUCTIONS FOR BEGINNERS WHO WANT TO RUN THIS PROGRAM WITH PERSONAL API's

  1 - Clone the repository.

  2 - Create the file named " application.yml " inside config.

  3 - Once you will have your own key's you can add then inside the "your_api_key" inside the following code.


        # Add configuration values here, as shown below.
        #
        # pusher_app_id: "2954"
        # pusher_key: 7381a978f7dd7f9a1117
        # pusher_secret: abdc3b896a0ffb85d373
        # stripe_api_key: sk_test_2J0l093xOyW72XUYJHE4Dv2r
        # stripe_publishable_key: pk_test_ro9jV5SNwGb1yYlQfzG17LHK
        #
        # production:
        #   stripe_api_key: sk_live_EeHnL644i6zo4Iyq4v1KdV9H
        #   stripe_publishable_key: pk_live_9lcthxpSIHbGwmdO941O1XVU

        Google_API_Key: "your_api_key"       <-------
        Watson_Key: "your_api_key"           <-------
        SENDGRID_API: "your_api_key"         <-------
        SLACK_API_TOKEN: "your_api_key"      <-------
        SLACK_API_WEBHOOK_URL: "your_api_key" <-------
        ZENDESK_URL: "your_api_key"          <-------
        ZENDESK_USERNAME: "your_api_key"     <-------
        ZENDESK_TOKEN: "your_api_key"        <-------
        TWILIO_ACCOUNT_SID: "your_api_key"   <-------
        TWILIO_AUTH_TOKEN: "your_api_key"    <-------
        TWILIO_PHONE_NUMBER: "your_api_key"  <-------


  4 - After implementing your key's, generate a file named " database.yml " and put your own database information inside "your_info"

  - The code will look like that : 

        # MySQL. Versions 5.1.10 and up are supported.
        #
        # Install the MySQL driver
        #   gem install mysql2
        #
        # Ensure the MySQL gem is defined in your Gemfile
        #   gem 'mysql2'
        #
        # And be sure to use new-style password hashing:
        #   https://dev.mysql.com/doc/refman/5.7/en/password-hashing.html
        #
        default: &default
          adapter: mysql2
          encoding: utf8
          pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
          username: root
          password:
          socket: /tmp/mysql.sock

        development:
          <<: *default
          database: "your_info"

        # Warning: The database defined as "test" will be erased and
        # re-generated from your development database when you run "rake".
        # Do not set this db to the same as development or production.
        test:
          <<: *default
          database: "your_info"

        # As with config/secrets.yml, you never want to store sensitive information,
        # like your database password, in your source code. If your source code is
        # ever seen by anyone, they now have access to your database.
        #
        # Instead, provide the password as a unix environment variable when you boot
        # the app. Read http://guides.rubyonrails.org/configuring.html#configuring-a-database
        # for a full rundown on how to provide these environment variables in a
        # production deployment.
        #
        # On Heroku and other platform providers, you may have a full connection URL
        # available as an environment variable. For example:
        #
        #   DATABASE_URL="mysql2://myuser:mypass@localhost/somedatabase"
        #
        # You can use this database configuration with:
        #
        #   production:
        #     url: <%= ENV['DATABASE_URL'] %>
        #
        production:
          <<: *default
          database: "your_info"
          username: "your_info"
          password: <%= ENV['"YOUR_INFO"'] %>

  
