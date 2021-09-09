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
      variable_name = "@so_meta_#{name}_interpolation"
      interpolation = instance_variable_get(variable_name) || {}
      hash.transform_values! { |v| html_escape(v) }
      instance_variable_set(variable_name, interpolation.merge(hash))
    end
  end
end
