require 'active_record'

include ActiveRecord::Tasks

load 'active_record/railties/databases.rake'

class SeedLoader
  def self.load_seed
    `psql #{db} < ddl/load_data.sql`

    puts "Reseting sequences"
    `psql #{db} < ddl/reset_sequences.sql`
  end
end

DatabaseTasks.env                    = ENV['ENV'] || 'default_env'
DatabaseTasks.root                   = File.expand_path('../', __FILE__)
DatabaseTasks.db_dir                 = File.expand_path('../db', __FILE__)
DatabaseTasks.migrations_paths       = File.expand_path('../db/migrate', __FILE__)
DatabaseTasks.seed_loader            = SeedLoader
DatabaseTasks.database_configuration = ActiveRecord::Base.configurations.configs_for(name: 'primary')

task :environment do
  ActiveRecord::Base.establish_connection DatabaseTasks.database_configuration
end
