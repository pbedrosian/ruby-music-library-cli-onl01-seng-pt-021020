#we will extend this into our other methods so they too have a find_by_name and 

module Concerns::Findable #this allows other class's to use these methods

  def find_by_name(name) #this works like a generic find_by_name method that was introduced in the Song class
    all.find do |object|
        object.name == name
    end
  end

#this works as Artist and Genre both have a create  method
  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
