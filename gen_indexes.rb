require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

def gen_indexes(file)
  defs = YAML::load_file file

  defs.each {|table, index_defs|

    puts "-- Indexes for #{table}"
    index_defs&.each {|id, attrs|

      unless "PrimaryKey" == id
        field_list    = attrs["Fields"].map(&:keys).flatten
        quoted_fields = field_list.map {|f| %Q{"#{f}"} }

        puts %Q{  create index index_#{table}_on_#{field_list.join('_')} on "#{table}" (#{quoted_fields.join(',')}); }
      else
        puts "  -- skipping Primary Key index"
      end
    }
  }
end

file = ARGV[0] || 'indexes.yaml'

gen_indexes(file)
