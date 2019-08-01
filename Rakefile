require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :mutant do
  sh(*%w(
    mutant
    --include lib
    --require excon_encoding_helper
    --use rspec
    ExconEncodingHelper*
  ))
end

task default: :spec
