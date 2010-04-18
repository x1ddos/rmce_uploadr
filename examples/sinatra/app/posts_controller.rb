module Sinatra
  
  module SinatraExample
    module Posts
      
      module Helpers
        def posts_path(path = nil)
          "/posts#{path}"
        end
      end
      
      def self.registered(app)
        app.helpers Sinatra::SinatraExample::Posts::Helpers
         
        app.get '/posts' do
          @posts = Post.all
          erb :'posts/index'
        end
        
        app.post '/posts' do
          @post = Post.new params['post']
          if @post.save
            redirect posts_path("/#{@post.id}")
          else
            erb :'posts/new'
          end
        end
        
        app.get '/posts/new' do
          @post = Post.new
          erb :'posts/new'
        end
        
        app.get '/posts/:id' do
          @post = Post.find(params['id'])
          erb :'posts/show'
        end
        
      end # self.registered(app)
      
    end # module Posts
  end # module SinatraExample
  register Sinatra::SinatraExample::Posts
end # module Sinatra