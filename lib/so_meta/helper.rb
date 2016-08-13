module SoMeta
  module Helper
    def so_meta(name, scope = nil)
      interpolation_data = instance_variable_get("@so_meta_#{name}_interpolation") || {}

      controller_name = controller_path.gsub(/\//, "_")

      if scope.present?
        t("so_meta.#{controller_name}.#{action_name}.#{scope}.#{name}",
          default: t("so_meta.#{controller_name}.#{action_name}.#{name}", interpolation_data.merge(default: t("so_meta.defaults.#{name}")))
        )
      end
    end

    def so_meta_interpolation(name, hash)
      instance_variable_set("@so_meta_#{name}_interpolation", hash)
    end
  end
end
