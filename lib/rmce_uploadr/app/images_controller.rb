module Sinatra
  
  module RMceUploadr
    module ImagesController
    
      module Helpers
      end # module Helpers
    
      # entry point for "register Sinatra::RMceUploadr::ImagesController"
      def self.registered(app)
        app.helpers Sinatra::RMceUploadr::ImagesController::Helpers
        
        app.get '/rmce_uploadr' do
          "hello from mce uploadr root path"
        end
        
        app.get '/rmce_uploadr/images' do
          @images = ::RMceUploadr::Image.all
          erb :index
        end
        
        # actual image upload 
        app.post '/rmce_uploadr/images' do
          data = Fash.new(params[:image][:data])
          puts data.inspect
          @image = ::RMceUploadr::Image.new(:data => data)
          @image.save
          redirect '/rmce_uploadr/images'
        end
      end
    
    end # module Defaults
  end # RMceUploadr
  
  register Sinatra::RMceUploadr::ImagesController
end # module Sinatra
