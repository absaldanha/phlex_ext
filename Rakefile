# frozen_string_literal: true

require "rake/testtask"
require "standard/rake"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :"test:coverage" do
  ENV["COVERAGE"] = "true"
  Rake::Task["test"].invoke
end
