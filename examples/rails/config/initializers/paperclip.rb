# This initializer is for testing purposes only
# It is not needed in a production environment

Paperclip.options[:log_command] = true
Paperclip.options[:swallow_stderr] = false

# Set up RMceUploadr db configuration here
# so we can use RMceUploadr::Image in script/console
#
# The real RMceUploadr::App middleware db config is set in environment.rb
RMceUploadr.dbconf = {
  :adapter => 'sqlite3', 
  :database => File.join(File.dirname(__FILE__), '..', '..', '..', 'shared', 'db.sqlite3')
}
