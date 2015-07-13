require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Link
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :assignment_id , :article_or_video
  attr_reader :id
  
  def initialize(options ={})
    @id = options["id"]
    @assignment_id = options["assignment_id"]
    @article_or_video = options["article_or_video"]
         
  end 
  
  # Allows information that was changed in ruby to be saved to SQL.
  #
  # Returns self, an object.
  def save
    CONNECTION.execute("UPDATE links SET assignment_id = '#{self.assignment_id}', article_or_video = '#{self.article_or_video}' WHERE id = #{self.id};")
     
     return self
  end
  
end