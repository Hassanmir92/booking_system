# frozen_string_literal: true

gem 'rake'
gem 'rubocop'
require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.pattern = 'test/*_test.rb'
  t.pattern = 'test/**/*_test.rb'
end

RuboCop::RakeTask.new
