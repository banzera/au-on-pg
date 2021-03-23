require 'active_record'

include ActiveRecord::Tasks

load 'active_record/railties/databases.rake'

db_dir     = File.expand_path('../db', __FILE__)
config_dir = File.expand_path('../config', __FILE__)

class SeedLoader
  def self.load_seed
    `psql #{db} < ddl/load_data.sql`

    puts "Reseting sequences"
    `psql #{db} < ddl/reset_sequences.sql`
  end
end

DatabaseTasks.root             = File.dirname(__FILE__)
DatabaseTasks.env              = ENV['ENV'] || 'default_env'
DatabaseTasks.db_dir           = db_dir
DatabaseTasks.seed_loader      = SeedLoader
DatabaseTasks.migrations_paths = File.join(db_dir, 'migrate')

# DatabaseTasks.database_configuration = YAML.load(File.read('database.yml'))
task :environment do
  # ActiveRecord::Base.configurations = {DatabaseTasks.env => DatabaseTasks.current_config}
  ActiveRecord::Base.establish_connection DatabaseTasks.current_config
end
