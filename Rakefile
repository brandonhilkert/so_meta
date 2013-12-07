require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "./rails_example_app/spec{,/*/**}/*_spec.rb"
end

task :default => :spec
