require 'bundler/setup'
require 'padrino-core/cli/rake'
PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)

PadrinoTasks.use(:database)
PadrinoTasks.use(:datamapper)
PadrinoTasks.init

puts "PADRINO_ENV: #{PADRINO_ENV}"
if PADRINO_ENV != ('production' || 'staging')
	require 'cucumber/rake/task'
	Cucumber::Rake::Task.new(:cucumber) do |task|
  	Rake::Task['db:migrate'].invoke
  	task.cucumber_opts = ["features"]
	end

	task :default => [:cucumber, :spec]
end
