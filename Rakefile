require 'rubygems'
require 'rake'

# add your tasks in lib/tasks
Dir["#{File.join(File.dirname(__FILE__), 'lib', 'tasks', '*.rake')}"].each { |ext| load ext }

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rmce_uploadr"
    gem.summary = %Q{Images uploader for TinyMCE editor}
    gem.description = %Q{Written in Ruby, using Sinatra + ActiveRecord and Paperclip}
    gem.email = "alex@cloudware.it"
    gem.homepage = "http://github.com/crhym3/rmce_uploadr"
    gem.authors = ["Alex Vagin"]
    gem.add_dependency "sinatra", ">= 1.0"
    gem.add_dependency "activerecord", ">= 2.3.4"
    gem.add_dependency "paperclip", ">= 2.3.1.1"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "rack-test", ">= 0.5.3"
    gem.files.include('lib/**/*.rb', 'lib/rmce_uploadr/public/**/*', 'lib/**/*.erb')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |rcov|
    rcov.libs << 'lib' << 'spec'
    rcov.pattern = 'spec/**/*_spec.rb'
    rcov.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "RMceUploadr #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
