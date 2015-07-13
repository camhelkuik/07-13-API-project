require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Assignment
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :name, :description, :github
  attr_reader :id
  
  def initialize(options ={})
    @id = options["id"]
    @name = options["name"]
    @desription = options["description"]
    @github = options["github"]
     
  end  
  
  # Allows information that was changed in ruby to be saved to SQL.
  #
  # Returns self, an object.
  def save
    CONNECTION.execute("UPDATE assignments SET name = '#{self.name}', description = '#{self.description}', github = '#{self.github}' WHERE id = #{self.id};")
     
     return self
  end
  
end