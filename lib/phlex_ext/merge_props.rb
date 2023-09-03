# frozen_string_literal: true

module PhlexExt
  module MergeProps
    def merge_props(first, second)
      return first unless second.present?
      return second unless first.present?

      first.merge(second) do |key, first_value, second_value|
        case key
        when :class
          tokens(first_value, second_value)
        when :data
          merge_data_attributes(first_value, second_value)
        else
          if first_value.is_a?(Hash) && second_value.is_a?(Hash)
            first_value.deep_merge(second_value)
          else
            second_value
          end
        end
      end
    end

    def merge_data_attributes(first, second)
      return first unless second.present?
      return second unless first.present?

      first.merge(second) do |_, first_value, second_value|
        if first_value.is_a?(Hash) && second_value.is_a?(Hash)
          merge_data_attributes(first_value, second_value)
        else
          tokens(first_value, second_value)
        end
      end
    end
  end
end
