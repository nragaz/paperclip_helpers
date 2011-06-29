require 'active_support/dependencies'

ActiveSupport.on_load(:action_controller) do
  include PaperclipHelpers::Attachments
end

module PaperclipHelpers
  autoload :Attachments, 'paperclip_helpers/attachments'
  autoload :SetGeometry, 'paperclip_helpers/set_geometry'
  autoload :TestHelpers, 'paperclip_helpers/test_helpers'
  
  class Engine < Rails::Engine
  end
end