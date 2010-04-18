Paperclip.options[:log_command] = true
Paperclip.options[:swallow_stderr] = false

RMceUploadr.dbconf = {
  :adapter => 'sqlite3', 
  :database => File.join(File.dirname(__FILE__), '..', '..', '..', 'db', 'shared.sqlite3')
}
