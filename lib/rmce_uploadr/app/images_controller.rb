module Sinatra
  
  module RMceUploadr
    module ImagesController
    
      module Helpers
      
      end # module Helpers
    
      # entry point for "register Sinatra::RMceUploadr::ImagesController"
      def self.registered(app)
        app.get '/rmce_uploadr' do
          "hello from mce uploadr root path"
        end
        
        app.get '/rmce_uploadr/images' do
          erb :index
        end
      end
    
    end # module Defaults
  end # RMceUploadr
  
  register Sinatra::RMceUploadr::ImagesController
end # module Sinatra
