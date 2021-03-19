Bundler.require(:default)
require 'rake/clean'
require 'securerandom'

CLOBBER.include %w[
  ddl/indexes2.sql
  ddl/load_data.sql
  dumps/*.clean.csv
  create_system_dsn.bat
]

RANDOM_DB_NAME = ENV['DB_NAME'] || SecureRandom.hex(4)

task :rebuild_heroku, [:db_name] => %w[bootstrap] do |t, args|
  db_name = args[:db_name] || RANDOM_DB_NAME

  `heroku pg:reset`

  next unless $?.success?

  `heroku pg:push #{db_name} DATABASE`
end

desc "Bootstrap a local PostgreSQL DB"
task :bootstrap, [:db_name] => %w[sanitize indexes_ddl load_ddl] do |t, args|
  db_name = args[:db_name] || RANDOM_DB_NAME

  # drop the DB if it exists
  `psql -l | grep #{db_name} && dropdb #{db_name}`

  `createdb #{db_name} "AU AUDIT Application DB"`

  puts "Loading schema"
  `psql -d #{db_name} < ddl/au-audit.sql`
  `psql -d #{db_name} < ddl/sequences.sql`

  puts "Loading data"
  `psql -d #{db_name} < ddl/load_data.sql`

  puts "Reseting sequences"
  `psql -d #{db_name} < ddl/reset_sequences.sql`

  puts "Creating indexes/foreign keys"
  `psql -d #{db_name} < ddl/indexes.sql`
  `psql -d #{db_name} < ddl/foreign_keys.sql`
end

dump_files = Rake::FileList.new("dumps/*.csv") do |fl|
  fl.exclude /clean/
end

desc "Sanitize the CSV dump files from Access"
task :sanitize => dump_files.ext(".clean.csv")

rule ".clean.csv" => ".csv" do |t|
    puts "Cleaning #{t.source}"
    `sed -E -e 's/\\$//g' -e 's/\\(([0-9]+\\.[0-9]+)\)/-\\1/g' #{t.source} > #{t.name}`
end

desc "Create the DDL for loading the data"
task :load_ddl => 'ddl/load_data.sql'

file 'ddl/load_data.sql' => dump_files.ext(".clean.csv") do |t|
  names = Hash[t.sources.map { |s|
    [s.gsub(/dumps\/|.clean.csv/,'') , "'#{s}'"]
  } ]

  j1 = names.keys.map(&:length).max + 1
  j2 = names.values.map(&:length).max + 1

  File.open(t.name, 'w') do |f|
    names.each do |table_name, quoted_src|
      f.puts "\\copy #{table_name.ljust(j1)} from #{quoted_src.ljust(j2)} with csv"
    end
  end
end

desc "Create the DDL for the indexes"
task :indexes_ddl => 'ddl/indexes2.sql'
file "ddl/indexes2.sql" => "indexes.yaml" do |t|

  defs = YAML::load_file t.source

  File.open(t.name, 'w') do |f|
    defs.each do |table, index_defs|

      f.puts "-- Indexes for #{table}"

      index_defs&.each do |id, attrs|

        unless "PrimaryKey" == id || attrs["Foreign"]
          field_list    = attrs["Fields"].map(&:keys).flatten
          quoted_fields = field_list.map {|f| %Q{"#{f}"} }

          f.puts %Q{  create index index_#{table}_on_#{field_list.join('_')} on "#{table}" (#{quoted_fields.join(',')}); }
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
    f.puts %Q{odbcconf CONFIGSYSDSN "PostgreSQL ANSI(x64)" "#{dsn_parts.join('|')}"}
  end
end
