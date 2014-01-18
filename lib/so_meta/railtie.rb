require 'rails'
require "so_meta/helper"

module SoMeta
  class Railtie < Rails::Railtie
    initializer "so_meta.helper" do
      ActiveSupport.on_load(:action_view) do
        include SoMeta::Helper
      end
    end
  end
end
