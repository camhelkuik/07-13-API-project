require "pry"
require "sinatra"
require "sinatra/reloader"
require 'active_support/core_ext/object/blank'

#SQL/databse
require "sqlite3"
require_relative "database-setup.rb"

#Models
require_relative "models/application.rb"


#Controllers
require_relative "controllers/main.rb"