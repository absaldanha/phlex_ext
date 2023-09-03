# frozen_string_literal: true

require "test_helper"

class PhlexExtTest < Minitest::Test
  class TestComponent < Phlex::HTML
    include PhlexExt
  end

  def test_includes_correct_inner_modules
    [
      PhlexExt::Attributes,
      PhlexExt::MergeProps,
      PhlexExt::RegisterComponent
    ].each do |mod|
      assert TestComponent.ancestors.include?(mod)
    end
  end
end
