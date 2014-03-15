require 'motion-cocoapods'
require 'motion-prime'
require 'motion-awesome'

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Require.all(Dir.glob(File.expand_path('../prime_awesome/**/*.rb', __FILE__)))

Motion::Project::App.setup do |app|
  
end