# frozen_string_literal: true

require "active_support/core_ext/module/introspection"

module PhlexExt
  module RegisterComponent
    extend ActiveSupport::Concern

    class_methods do
      def register_component(name, as: nil, from: module_parent)
        method_name = as || name

        component_class = from.const_get(name.to_s.camelize, false)

        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          private

          def #{method_name}(...)
            render #{component_class}.new(...)
          end
        RUBY
      end
    end
  end
end
