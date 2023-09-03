# frozen_string_literal: true

require "test_helper"

module PhlexExt
  class MergePropsTest < Minitest::Test
    include MergeProps
    include Phlex::Helpers

    def test_deep_merges_to_hashes
      first = {a: 1, b: 2, c: {d: 3}}
      second = {a: "a", c: {e: "e"}}

      assert_equal(
        {a: "a", b: 2, c: {d: 3, e: "e"}},
        merge_props(first, second)
      )
    end

    def test_appends_values_of_class_key
      first = {class: "a b c"}
      second = {class: "d e f"}

      assert_equal(
        {class: "a b c d e f"},
        merge_props(first, second)
      )
    end

    def test_appends_values_of_data_attributes
      first = {data: {controller: "foo", action: "foo_action"}}
      second = {data: {controller: "bar", action: "bar_action"}}

      assert_equal(
        {data: {controller: "foo bar", action: "foo_action bar_action"}},
        merge_props(first, second)
      )
    end

    def test_appends_values_of_deep_nested_data_attributes
      first = {data: {foo: {bar: {fuz: "fuz"}}}}
      second = {data: {foo: {bar: {fuz: "second_fuz", buz: "buz"}}}}

      assert_equal(
        {data: {foo: {bar: {fuz: "fuz second_fuz", buz: "buz"}}}},
        merge_props(first, second)
      )
    end
  end
end
