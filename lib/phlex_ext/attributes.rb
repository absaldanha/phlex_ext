# frozen_string_literal: true

module PhlexExt
  module Attributes
    extend ActiveSupport::Concern

    include ActiveModel::Attributes
    include MergeProps

    attr_reader :props

    included do
      class_attribute :default_props, instance_writer: false, default: {}
    end

    def initialize(attributes = {}, &block)
      super(&block)

      @props = {}
      assign_attributes(Hash(attributes))
    end

    def full_props
      merge_props(default_props, props.dup)
    end

    private

    def assign_attributes(attributes)
      attributes.each do |key, value|
        setter = :"#{key}="

        if respond_to?(setter)
          public_send(setter, value)
        else
          @props[key.to_sym] = value
        end
      end
    end
  end
end
