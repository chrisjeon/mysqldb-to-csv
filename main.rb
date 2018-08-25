require 'fileutils'
require 'mysql2'
require 'csv'

database_name = ARGV[0]

client = Mysql2::Client.new(host: 'localhost', username: 'root', database: database_name)

table_names = client.query('show tables').to_a.map(&:values).flatten

FileUtils::mkdir_p database_name

table_names.each do |table_name|
  results = client.query("select * from #{table_name}")
  CSV.open("#{database_name}/#{table_name}.csv", 'wb') do |csv|
    results.each_with_index do |row, index|
      if index == 0
        csv << row.keys
      else
        csv << row.values
      end
    end
  end
end
