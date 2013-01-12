#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Birdses'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

# RSpec as default
task :default => :spec

desc 'create git repo for the wiki'
task :init_wiki do
  sh 'mkdir -p spec/dummy/wiki/'
  Dir.chdir('spec/dummy/wiki') do
    sh 'git init && echo "Hi" > home.md && git add . && git commit -m "init"'
  end
end

Bundler::GemHelper.install_tasks
