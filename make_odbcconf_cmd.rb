#!/bin/env ruby

# usage:
# gen_system_dsn.rb DSN_NAME DATABASE_URL
#
dsn = ARGV[0] || ENV.fetch('DSN_NAME')
url = ARGV[1] || ENV.fetch('DATABASE_URL')

uri = URI.parse url

dsn_parts = [
  "DSN=#{dsn}",
  "UID=#{uri.user}",
  "PWD=#{uri.password}",
  "PORT=#{uri.port || 5432}",
  "SERVER=#{uri.host}",
  "DATABASE=#{uri.path[1..]}",
  "SSLMODE=prefer",
]

puts %Q{odbcconf CONFIGSYSDSN "PostgreSQL ANSI" "#{dsn_parts.join('|')}"}
