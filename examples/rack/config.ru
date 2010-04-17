# run this rackup with e.g.
# "shotgun -s thin -o 0.0.0.0 -p 3003"

require '../../lib/rmce_uploadr'
# instead of the line above use this in a real environment:
#
# require 'rubygems'
# require 'rmce_uploadr'

run RMceUploadr::App
