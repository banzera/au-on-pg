Bundler.require(:default)
require 'dotenv/load'
require 'rake/clean'
require 'securerandom'
require_relative 'lib/db'
require_relative 'lib/task_helpers'

include TaskHelpers

RANDOM_DB_NAME = ENV['DB_NAME'] || SecureRandom.hex(4)

namespace :heroku do
  desc "Reset the remote database and push a named local database"
  task :rebuild, [:db_name]  do |t, args|
    db_name = args[:db_name] || RANDOM_DB_NAME

    `heroku pg:reset`

    next unless $?.success?

    `heroku pg:push #{db_name} DATABASE`
  end
end

namespace :db do
  desc "Print active DB URL components"
  task :details do
    puts parse_database_url
  end

  desc "List active DB tables"
  task :list_tables do
    puts "Listing defined relations in #{db}"
    cmd = %Q|psql -c '\\d' #{db}|
    `#{cmd}`
  end

  desc "Bootstrap a local PostgreSQL DB"
  task :bootstrap => %w[
                        ddl:indexes
                        drop:_unsafe
                        create
                        mdb:dump:data
                        ddl:data
                        load:schema
                        load:data
                      ]

  desc "Refresh the data in the database"
  task :refresh => %w[
                      ddl:indexes
                      mdb:dump:data
                      ddl:data
                      reset_schema
                      load:schema
                      load:data]

  task :reset_schema => :environment do
    SCHEMA_NAME = 'public'.freeze
    puts "Dropping schema #{SCHEMA_NAME} on #{parse_database_url[:database]}"
    ActiveRecord::Base.connection.drop_schema SCHEMA_NAME
    puts "Creating schema #{SCHEMA_NAME} on #{parse_database_url[:database]}"
    ActiveRecord::Base.connection.create_schema SCHEMA_NAME
  end

  namespace :load do
    desc "Load the schema DDL into a named database"
    task :schema do |t, args|
      puts "Loading schema"
      `psql #{db} < ddl/au-audit.sql`
      `psql #{db} < ddl/sequences.sql`
      `psql #{db} < ddl/views.sql`
    end

    desc "Load the prepared dataset into a named database"
    task :data => %w['ddl:data'] do |t, args|
      puts "Loading data"
      `psql #{db} < ddl/load_data.sql`

      puts "Reseting sequences"
      `psql #{db} < ddl/reset_sequences.sql`

      puts "Creating indexes/foreign keys"
      `psql #{db} < ddl/indexes.sql`
      `psql #{db} < ddl/foreign_keys.sql`
      `psql #{db} < ddl/triggers.sql`
    end
  end
end

namespace :mdb do
  desc "Fetch latest Access DB"
  task :fetch => mdb
  file mdb do |t|
    require "down"
    uri = ENV['ACCDB_URL']
    puts "Fetching Access DB from #{uri}"
    Down.download uri, destination: t.name
  end

  namespace :dump do
    desc "Dump data from Access DB"
    task :all => [mdb, 'schema'] do
      puts "Dumping data from #{mdb}"
      tables.each do |t|
                    # -Q \
        `mdb-export -H \
                    -D '%F' \
                    -T '%F %T' \
                    #{mdb} #{t} 2> /dev/null \
                                1> dumps/#{t}.csv`
      end
    end

    desc "Dump schema from Access DB"
    task :schema => 'ddl/schema.sql'
    file 'ddl/schema.sql' => mdb do
      puts "dumping schema"

      `mdb-schema          \
          --indexes        \
          --comments       \
          --default-values \
          --not-null       \
          audit.accdb postgres 2> /dev/null \
                               1> ddl/schema.sql
        `
    end
  end
end

# DUMP_FILES = Rake::FileList.new("dumps/*.csv") do |fl| fl.exclude /clean/ end
DUMP_FILES = Rake::FileList.new do |fl|
  fl.include tables.map { |t| "dumps/#{t}.csv" }
end

desc "Sanitize the CSV dump files from Access"
task :sanitize => DUMP_FILES.ext(".clean-csv")

rule ".csv" => mdb do |t|
  puts "Dumping data in #{mdb} from #{t.name}"
  table_name = t.name.pathmap('%n')
  `mdb-export -H -D '%F' -T '%F %T' #{mdb} #{table_name} 1> #{t.name} 2> /dev/null`
end

def source_for_csv_file(csv_file)
  DUMP_FILES.detect {|f| f == csv_file.gsub('.clean', '')}
end

rule ".clean-csv" => ".csv" do |t|
    puts "Cleaning #{t.source}"
    # `sed -E -e 's/\\$//g' -e 's/\\(([0-9]+\\.[0-9]+)\)/-\\1/g' #{t.source} > #{t.name}`
    # `sed -E -e 's/\\$//g' #{t.source} > #{t.name}`
    `sed -E -e 's/\"1900-01-00 00:00:00\"//g' #{t.source} > #{t.name}`
end

namespace :ddl do
  desc "Create the DDL for loading the data"
  task :data => %w[ddl/load_data.sql]
  file 'ddl/load_data.sql' => DUMP_FILES.ext(".clean-csv") do |t|
    puts "Generating the data import DDL"
    names = Hash[t.sources.map { |s|
      [s.gsub(/dumps\/|.clean-csv/,'') , "'#{s}'"]
    } ]

    next unless names.any?

    j1 = names.keys.map(&:length).max + 1
    j2 = names.values.map(&:length).max + 1

    File.open(t.name, 'w') do |f|
      names.each do |table_name, quoted_src|
        f.puts "\\copy #{table_name.ljust(j1)} from #{quoted_src.ljust(j2)} with csv"
      end
    end
  end

  desc "Create the DDL for the indexes"
  task :indexes => 'ddl/indexes.sql'
  file "ddl/indexes.sql" => "indexes.yaml" do |t|
    defs = YAML::load_file t.source

    File.open(t.name, 'w') do |f|
      defs&.each do |table, index_defs|
        f.puts "-- Indexes for #{table}"

        index_defs&.each do |id, attrs|

          unless "PrimaryKey" == id || attrs["Foreign"]
            field_list    = attrs["Fields"].map(&:keys).flatten
            # quoted_fields = field_list.map {|f| %Q{"#{f}"} }
            unique = attrs["Unique"] ? 'UNIQUE' : ''

            f.puts %Q|  CREATE #{unique} INDEX index_#{table}_on_#{field_list.join('_')} ON #{table} (#{field_list.join(',')}); |
          end
        end
      end
    end
  end
end

desc "Create a batch file to install a system DSN for the Heroku DB"
task :odbcconf => "create_system_dsn.bat"
file "create_system_dsn.bat" do |t|
  dsn = ENV.fetch('DSN_NAME', 'audit-pg_heroku')

  puts "Getting credentials from Heroku..."
  url = `heroku pg:credentials:url | grep postgres`

  uri = URI(url.lstrip.chomp)

  dsn_parts = [
    "DSN=#{dsn}",
    "UID=#{uri.user}",
    "PWD=#{uri.password}",
    "PORT=#{uri.port || 5432}",
    "SERVER=#{uri.host}",
    "DATABASE=#{uri.path[1..]}",
    "SSLMODE=prefer",
  ]

  puts "Writing file #{t.name}"
  File.open(t.name, 'w') do |f|
    f.puts %Q{odbcconf CONFIGSYSDSN "PostgreSQL Unicode(x64)" "#{dsn_parts.join('|')}"}
  end
end
