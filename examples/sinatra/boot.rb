# Carnival boostrap code
unless defined? SinatraExample
  
  RACK_ENV = ENV["RACK_ENV"] ||= "development" unless defined? RACK_ENV
  ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

  # e.g. root_path('config/settings.yml) # => /full/path/to/config/settings.yml
  # extracted from monk-glue gem
  def root_path(*args)
    File.join(ROOT_DIR, *args)
  end
  
  require 'rubygems'
  require 'bundler'
  Bundler.setup(:default, RACK_ENV.to_sym)

  # database backend
  require 'active_record'

  # rack add-ons
  require 'rack-flash'

  # base of this whole app
  require 'sinatra/base'
  
  # rmce_uploadr middleware
  require 'rmce_uploadr'
  
  # define empty main module so nobody complains
  module SinatraExample; end

  # load app models and controllers
  Dir[root_path('app', '*.rb')].each { |file| require file }
  

  # setup active record db connection
  ActiveRecord::Base.establish_connection({
    :adapter => 'sqlite3',
    :database => root_path('db', "#{RACK_ENV}.sqlite3")
  })
  ActiveRecord::Base.logger = Logger.new(STDOUT)

  #
  # main sinatra app, inside DisiCloudMedia module.
  #
  module SinatraExample
    class App < Sinatra::Base
      set :app_file, __FILE__
    
      set :dump_errors, true
      set :methodoverride, true
      set :raise_errors, Proc.new { test? || development? }
      set :root, root_path
      set :run, Proc.new { $0 == app_file }
      set :show_exceptions, Proc.new { development? }
      set :static, true
      set :views, root_path('views')
      
      use Rack::Session::Cookie
      use Rack::Flash
      
      use ::RMceUploadr::App do |conf|
        conf.dbconf = {:adapter => 'sqlite3', 
                       :database => root_path('..', 'shared', 'db.sqlite3')}
      end
      
      register Sinatra::SinatraExample::Posts
      
      # root URL
      get '/' do
        redirect posts_path
      end
    end
  end

  # this is to run the app with "ruby boot.rb"
  # don't need for a rackup though.
  SinatraExample::App.run! if SinatraExample::App.run?
end # unless defined? Carnival
