# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "phlex_ext/version"

Gem::Specification.new do |spec|
  spec.name = "phlex_ext"
  spec.version = PhlexExt::Version::STRING
  spec.authors = ["Alexandre Saldanha"]
  spec.email = ["absaldanha@protonmail.com"]
  spec.summary = "Phlex extension"
  spec.license = "MIT"

  spec.required_ruby_version = ["> 3.0", "< 3.3"]

  spec.metadata = {
    "source_code_uri" => "https://github.com/absaldanha/phlex_ext"
  }

  spec.files = Dir["lib/**/*"]

  spec.require_path = "lib"

  spec.add_dependency "zeitwerk", "~> 2.6"
  spec.add_dependency "phlex", "~> 1.8"
  spec.add_dependency "activesupport", "~> 7.0"
  spec.add_dependency "activemodel", "~> 7.0"

  spec.add_development_dependency "minitest", "~> 5.17"
  spec.add_development_dependency "minitest-focus", "~> 1.3"
  spec.add_development_dependency "minitest-reporters", "~> 1.5"
  spec.add_development_dependency "standard", "~> 1.28"
  spec.add_development_dependency "simplecov", "0.22.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
