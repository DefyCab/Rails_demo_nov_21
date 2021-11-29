unless Rails.env.production?
  require 'rpsec/core/rake_task'
  require 'coveralls/rake/task'

  Coveralls::RakeTask.new

  namespace :ci do
    desc 'Run all test and generate a merged coverage report'
    task tests: [:spec, 'coveralls:push']
  end
end
