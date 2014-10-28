require File.expand_path 'application.rb'

ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml')))
