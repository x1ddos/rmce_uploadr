# RMceUploader standalong app
#unless defined? RMceUploadr
  
  RACK_ENV = ENV["RACK_ENV"] || ENV["RAILS_ENV"] || "development" unless defined? RACK_ENV
  ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

  require 'rubygems'
  # require 'bundler'
  #   Bundler.setup(:default, RACK_ENV.to_sym)

  # returns a path related to where this file is directory
  def root_path(*args)
    File.join(ROOT_DIR, *args)
  end

  # def appconf(key)
  #   $application_config ||= YAML.load_file(root_path("config", "settings.yml"))[RACK_ENV.to_sym]
  # 
  #   unless $application_config.include?(key)
  #     message = "No setting defined for #{key.inspect}."
  #     defined?(logger) ? logger.warn(message) : $application_config.puts(message)
  #   end
  # 
  #   $application_config[key]
  # end

  # database backend
  # require 'couchrest'
  # require 'couchrest-uniqueness-validation'
  
  # XML serialization
  # require 'builder'

  # support for openId memcache store
  # require 'system_timer' # fast timeout library for memcache
  # require 'memcache'
    
  # rack add-ons
  #require 'rack-flash'

  # base of this whole app
  require 'sinatra/base'
  # respond_to blocks
  #require 'sinatra/respond_to'
  
  # a hack to make missing templates render 404 instead of 500
  # module DisiCloudMedia; module RespondTo; class MissingTemplate < Sinatra::NotFound
  #   def code; 404 end
  # end; end; end

  # define empty main module so nobody complains
  module RMceUploadr; end

  # load core modules. they'll load up everything else
  Dir[root_path('rmce_uploadr', '*.rb')].each { |file| require file }
  # # models
  # # load the base class which will then require all the other models
  # require root_path('models', 'base') 
  # # controllers
  # Dir[root_path('controllers', '**', '*.rb')].each { |file| require file }

  require root_path('rmce_uploadr', 'app', 'app')

  # this is to run the app with "ruby rmce_uploadr.rb"
  # don't need for a rackup though.
  RMceUploadr::App.run! if RMceUploadr::App.run?
#end # unless defined? RMceUploadr
