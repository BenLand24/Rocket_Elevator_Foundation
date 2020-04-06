# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

Rails.application.config.assets.precompile += %w( admin.js admin.css )

# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( essentials.css )
Rails.application.config.assets.precompile += %w( layout.css )
Rails.application.config.assets.precompile += %w( header-1.css )
Rails.application.config.assets.precompile += %w( blue.css )
Rails.application.config.assets.precompile += %w( plugins/bootstrap/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( plugins/slider.revolution/css/extralayers.css )
Rails.application.config.assets.precompile += %w( plugins/slider.revolution/css/settings.css )

Rails.application.config.assets.precompile += %w( demo.js )
Rails.application.config.assets.precompile += %w( contact.js )
Rails.application.config.assets.precompile += %w( scripts.js )
Rails.application.config.assets.precompile += %w( calculator.js )
Rails.application.config.assets.precompile += %w( plugins/slider.revolution/js/jquery.themepunch.tools.min.js )
Rails.application.config.assets.precompile += %w( plugins/slider.revolution/js/jquery.themepunch.revolution.min.js )

#reda add that
Rails.application.config.assets.precompile += %w( demo.revolution_slider.js )


Rails.application.config.assets.precompile += %w( plugins/jquery.nav.min.js )
Rails.application.config.assets.precompile += %w( plugins/jquery/jquery-3.3.1.min.js )
Rails.application.config.assets.precompile += %w( plugins/smoothscroll.js )
Rails.application.config.assets.precompile += %w( plugins/mixitup/jquery.mixitup.min.js )
Rails.application.config.assets.precompile += %w( plugins/bootstrap/css/bootstrap.min.css )



