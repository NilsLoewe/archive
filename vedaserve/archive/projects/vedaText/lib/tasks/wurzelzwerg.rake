namespace :wurzelzwerg do
  # TODO The worker server won't have a database, so get either rid of the
  # rails dependency for the worker server or create an environment without database,
  # which could be tricky b/c nobody knows how the models will react to that
  desc "Start worker"
  task :worker => :environment do
    Messenger.listen_queues
  end
end
