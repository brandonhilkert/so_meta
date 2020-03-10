module SoMeta
  module Helper
    def so_meta(name, scope = nil)
      interpolation_data = instance_variable_get("@so_meta_#{name}_interpolation") || {}

      request_key = "so_meta.#{controller_path.gsub(/\//, "_")}.#{action_name}"

      if scope.present?
        begin
          return I18n.translate!("#{request_key}.#{scope}.#{name}", interpolation_data)
        rescue I18n::MissingTranslationData
          nil
        end
      end

      t("#{request_key}.#{name}", interpolation_data.merge(default: t("so_meta.defaults.#{name}")))
    end

    def so_meta_interpolation(name, hash)
      instance_variable_set("@so_meta_#{name}_interpolation", hash)
    end
  end
end
