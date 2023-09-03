# frozen_string_literal: true

require "test_helper"

module PhlexExt
  class AttributesTest < Minitest::Test
    class TestComponent < Phlex::HTML
      include PhlexExt::Attributes

      self.default_props = {some: "default"}

      attribute :foo
      attribute :bar, default: "bar"
    end

    def test_attributes_are_extracted_from_props
      component = TestComponent.new(fuz: "fuz", foo: "foo", class: "class")

      assert_equal "foo", component.foo
      assert_equal "bar", component.bar
      assert_equal({fuz: "fuz", class: "class"}, component.props)
    end

    def test_full_props_returns_default_props_with_given_props
      component = TestComponent.new(foo: "foo", class: "class")

      assert_equal({some: "default", class: "class"}, component.full_props)
    end
  end
end
