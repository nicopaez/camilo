require 'bundler/setup'
require 'padrino-core/cli/rake'
require 'cucumber/rake/task'

PadrinoTasks.use(:database)
PadrinoTasks.use(:datamapper)
PadrinoTasks.init

Cucumber::Rake::Task.new(:cucumber) do |task|
  Rake::Task['db:migrate'].invoke
  task.cucumber_opts = ["features"]
end

task :default => [:spec]
