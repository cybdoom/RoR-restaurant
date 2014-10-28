require 'active_record'
require 'yaml'
require 'mysql'
require 'logger'

namespace :db do
  task :default => :migrate

  desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
  task :migrate => :environment do
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
  end

  desc "Seeds database with some data"
  task :seed => :environment do
    require File.join('.', 'application')
    require File.join(Application::ROOT, 'db', 'seeds')
  end

  desc "Create the current database"
  task :create do
    db_config = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection db_config.merge({ database: 'mysql' })
    ActiveRecord::Base.connection.create_database 'restaurant'
  end

  task :environment do
    ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml')))
    ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
  end
end
