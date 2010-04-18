%w(mash fash).each { |ext| 
  require root_path('rmce_uploadr', 'core', ext)
}
