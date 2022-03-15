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
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( dhtmlxscheduler.css )
Rails.application.config.assets.precompile += %w( dhtmlxscheduler_material.css )
Rails.application.config.assets.precompile += %w( dhtmlxscheduler.js )
Rails.application.config.assets.precompile += %w( ext/dhtmlxscheduler_recurring.js )
Rails.application.config.assets.precompile += %w( ext/dhtmlxscheduler_limit.js )
Rails.application.config.assets.precompile += %w( locale/locale_ru.js )
Rails.application.config.assets.precompile += %w( commontator/application.js )
Rails.application.config.assets.precompile += %w( commontator/application.css )
Rails.application.config.assets.precompile += %w( calendar.js )
Rails.application.config.assets.precompile += %w( calendar_customer_form.js )
