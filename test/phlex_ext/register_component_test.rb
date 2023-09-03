# frozen_string_literal: true

require "test_helper"
require "phlex/testing/view_helper"

module PhlexExt
  class RegisterComponentTest < Minitest::Test
    include Phlex::Testing::ViewHelper

    class BarComponent < Phlex::HTML
      def template
        div { "bar" }
      end
    end

    class FooComponent < Phlex::HTML
      include RegisterComponent

      register_component :bar_component

      def template = bar_component
    end

    class FooWithAliasComponent < Phlex::HTML
      include RegisterComponent

      register_component :bar_component, as: :something

      def template = something
    end

    class FooWithInnerFuzComponent < Phlex::HTML
      class FuzComponent < Phlex::HTML
        def template
          span { "fuz" }
        end
      end

      include RegisterComponent

      register_component :fuz_component, from: self

      def template = fuz_component
    end

    def test_register_component_registers_components
      assert_equal(
        "<div>bar</div>",
        render(FooComponent.new)
      )
    end

    def test_register_component_registers_with_alias
      assert_equal(
        "<div>bar</div>",
        render(FooWithAliasComponent.new)
      )
    end

    def test_register_component_registers_from_other_namespaces
      assert_equal(
        "<span>fuz</span>",
        render(FooWithInnerFuzComponent.new)
      )
    end
  end
end
