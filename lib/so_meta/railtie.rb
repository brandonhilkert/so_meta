require 'rails'

module SoMeta
  class Railtie < Rails::Railtie
    initializer "so_meta.helper" do
      ActionView::Base.send :include, Helper
    end
  end
end
