module SoMeta
  module Helper
    def so_meta(name)
      interpolation_data = instance_variable_get("@so_meta_#{name}_interpolation") || {}
      t("so_meta.#{controller_path.gsub(/\//, "-")}.#{action_name}.#{name}", interpolation_data.merge(default: t("so_meta.defaults.#{name}")))
    end

    def so_meta_interpolation(name, hash)
      instance_variable_set("@so_meta_#{name}_interpolation", hash)
    end
  end
end
