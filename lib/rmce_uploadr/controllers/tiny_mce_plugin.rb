module Sinatra
  
  module RMceUploadr
    module TinyMcePlugin
    
      module Helpers
      
      end # module Helpers
    
      # entry point for "register Sinatra::RMceUploadr::TinyMcePlugin"
      def self.registered(app)
      end
    
    end # module Defaults
  end # RMceUploadr
  
  register Sinatra::RMceUploadr::TinyMcePlugin
end # module Sinatra
