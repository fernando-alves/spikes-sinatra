require 'rspec'
require 'rack/test'
require 'rspec/core/rake_task'

RSpec.configure do |conf|
    conf.include Rack::Test::Methods
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
