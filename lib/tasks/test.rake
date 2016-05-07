Rake::Task['test:run'].clear

namespace :test do

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.fail_on_error = false
  end

  task :run => ['spec', 'spec:javascript']

end
