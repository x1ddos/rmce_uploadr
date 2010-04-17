#
# main sinatra app, inside RMceUploadr module.
#
module RMceUploadr
  class App < Sinatra::Base
    set :app_file, __FILE__
    set :run, Proc.new { $0 == app_file }
    set :dump_errors, true
    set :methodoverride, true
    set :raise_errors, Proc.new { test? || development? }
    set :show_exceptions, Proc.new { development? }
    
    set :static, true
    set :root, root_path('rmce_uploadr')
    set :public, root_path('rmce_uploadr', 'public')
    set :views, root_path('rmce_uploadr', 'views')
    
    use Rack::Session::Cookie
    #use Rack::Flash
    
    # respond_to blocks in routes
    #register Sinatra::RespondTo
    
    # all action_pack-like helpers
    #register Padrino::Helpers
    
    # find them in controllers/*.rb
    # it is important that RMceUploadr::Defaults gets registered before other extensions
    register Sinatra::RMceUploadr::Defaults
    # register RMceUploadr::Tags
  end
end
