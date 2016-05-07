Rake::Task['test:run'].clear

namespace :test do

  task :run => ['spec', 'spec:javascript']

end
