# load the environment if not already loaded 
ENV['RACK_ENV'] ||= 'test'

# let ruby know where the code is
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'

require 'rmce_uploadr'
require 'rake'
require 'rack/test'
require 'spec'
require 'spec/autorun'

module RMceUploadr; module Test; module Controllers
  def app
    @app ||= ::RMceUploadr::App
  end
end; end; end

Spec::Runner.configure do |config|
  Rake.application = Rake::Application.new
  # load File.join(File.dirname(__FILE__), '..', 'Rakefile')
  config.before(:all) do
    # before :all tests config
  end
  
  config.after(:all) do
    # after :all tests config
  end
  
  config.include(Rack::Test::Methods, RMceUploadr::Test::Controllers, :type => :controller)
end
