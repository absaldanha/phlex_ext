# frozen_string_literal: true

require "zeitwerk"
require "phlex"
require "active_support"
require "active_model"

module PhlexExt
  extend ActiveSupport::Concern

  def self.loader
    @loader ||= Zeitwerk::Loader.for_gem.tap do |loader|
      loader.tag = "phlex_ext"
    end
  end

  included do
    include Attributes
    include RegisterComponent
  end

  loader.setup
end
