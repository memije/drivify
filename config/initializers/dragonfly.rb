require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "7c10a9f936d3d3a830f6bcfb3b37ada9de5a92faae659ffa0949903c40c86c55"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
