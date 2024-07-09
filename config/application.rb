require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProjectTask
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # config good job for bg jobs
    config.active_job.queue_adapter = :good_job
    config.good_job.enable_cron = true
    config.good_job.cron = {
      # Every 15 minutes, enqueue `ExampleJob.set(priority: -10).perform_later(42, "life", name: "Alice")`
      urgent_task: { # each recurring job must have a unique key
        cron: "@midnight", # cron-style scheduling format by fugit gem
        class: "UrgentTaskJob" # name of the job class as a String; must reference an Active Job job class
      }
      # etc.
    }
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Nairobi"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
