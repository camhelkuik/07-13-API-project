require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Partner
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :assignment_id, :partner
  attr_reader :id
  
  def initialize(options ={})
    @id = options["id"]
    @assignment_id = options["assignment_id"]
    @partner = options["partner"]
     
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
    CONNECTION.execute("UPDATE partners SET assignment_id = '#{self.assignment_id}', partner = '#{self.partner}' WHERE id = #{self.id};")
     
     return self
  end
  
end