require rmce_uploadr_root_path('rmce_uploadr', 'app', 'image')
require rmce_uploadr_root_path('rmce_uploadr', 'app', 'images_controller')

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
    set :root, rmce_uploadr_root_path('rmce_uploadr')
    set :public, rmce_uploadr_root_path('rmce_uploadr', 'public')
    set :views, rmce_uploadr_root_path('rmce_uploadr', 'views')
    
    # a host that distributes static content
    # can be set in use RMceUPloadr::App do |conf| block like
    # conf.settings.set :cdn_host, "http://cdn.host.com/"
    set :cdn_host, nil
    
    def dbconf=(opts)
      RMceUploadr.dbconf = opts
    end
    
    use Rack::Session::Cookie
    #use Rack::Flash
    register Sinatra::RMceUploadr::ImagesController
  end
end
