module Sinatra
  
  module RMceUploadr
    module Defaults
    
      module Helpers
      
      end # module Helpers
    
      # entry point for "register Sinatra::RMceUploadr::Defaults"
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
  
  register Sinatra::RMceUploadr::Defaults
end # module Sinatra
