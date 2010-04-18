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

  # before all tests begin
  config.before(:all) do
    test_db = File.join(File.dirname(__FILE__), 'dummy.sqlite3')
    FileUtils.cp File.join(File.dirname(__FILE__), 'test.sqlite3'), test_db
    
    ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => test_db)
  end
  
  # after :all tests end
  config.after(:all) do
    FileUtils.rm File.join(File.dirname(__FILE__), 'dummy.sqlite3')
  end
  
  config.include(Rack::Test::Methods, RMceUploadr::Test::Controllers, :type => :controller)
end
