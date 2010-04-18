require '../../lib/rmce_uploadr'

require 'rubygems'
require 'sinatra'

use RMceUploadr::App do |conf|
  conf.dbconf = {:adapter => 'sqlite3', 
                :database => File.join(File.dirname(__FILE__), '..', 'db', 'shared.sqlite3')}
end


get '/' do
  "hello from a sinatra test app!"
end
