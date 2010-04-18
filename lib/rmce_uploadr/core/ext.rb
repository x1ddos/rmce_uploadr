%w(mash fash).each { |ext| 
  require rmce_uploadr_root_path('rmce_uploadr', 'core', ext)
}
