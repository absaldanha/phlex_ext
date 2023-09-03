# frozen_string_literal: true

if ENV["COVERAGE"]
  require "simplecov"
end

require "bundler/setup"
require "phlex_ext"
require "minitest/autorun"
require "minitest/focus"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
