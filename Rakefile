require 'bundler/setup'
require 'padrino-core/cli/rake'

PadrinoTasks.use(:database)
PadrinoTasks.use(:datamapper)
PadrinoTasks.init

if ENV['PADRINO_ENV'] != ('production' || 'staging')
	require 'cucumber/rake/task'
	Cucumber::Rake::Task.new(:cucumber) do |task|
  	Rake::Task['db:migrate'].invoke
  	task.cucumber_opts = ["features"]
	end

	task :default => [:cucumber, :spec]
end
