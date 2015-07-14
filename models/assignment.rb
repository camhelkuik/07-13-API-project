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
    @description = options["description"]
    @github = options["github"]
     
  end  
  
  # Get all of the rows for a table.
  #
  # Returns an Array containing Hashes for each row.
  def self.all_as_hash     
   CONNECTION.execute("SELECT * FROM #{self.table_name}")
     
  end
  
  # Get multiple rows based on Integer ID.
  #
  # field_name - the String name of the column to look for the record's ID
  # record_id - The record's Integer ID.
  #
  # Returns an Array containing the Hash of the rows.
  def self.find_rows_hash(field_name, record_id)    
    CONNECTION.execute("SELECT * FROM #{self.table_name} WHERE #{field_name} = #{record_id}")
   
   end
  
  # Get a single row.
  #
  # record_id - The record's Integer ID.
  #
  # Returns an Array containing the Hash of the row.
  def self.find_as_hash(record_id)    
    CONNECTION.execute("SELECT * FROM #{self.table_name} WHERE id = #{record_id}").first
  
 end
  
  # Allows information that was changed in ruby to be saved to SQL.
  #
  # Returns self, an object.
  def save
    CONNECTION.execute("UPDATE assignments SET name = '#{self.name}', description = '#{self.description}', github = '#{self.github}' WHERE id = #{self.id};")
     
     return self
  end
  
end