require "pry"
require "sinatra"
require "sinatra/reloader"
require 'active_support/core_ext/object/blank'

#SQL/databse
require "sqlite3"
require_relative "database-setup.rb"

#Models
require_relative "models/assignment.rb"
require_relative "models/link.rb"
require_relative "models/partner.rb"

#Controllers
require_relative "controllers/add.rb"
