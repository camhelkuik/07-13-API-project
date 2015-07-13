require "pry"
require "sinatra"
require "sinatra/reloader"
require "sinatra/json"
set :bind, 192.168.1.102
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
require_relative "controllers/view.rb"
require_relative "controllers/update.rb"
require_relative "controllers/delete.rb"
require_relative "controllers/api_controller.rb"
