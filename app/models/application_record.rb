class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def as_json(options = {})
    json_hash = super
    json_hash.deep_transform_keys { |key| key.to_s.camelize(:lower) }   
    # camelize_lower = Proc.new {|a| a.camelize(:lower)}
    # json_hash.deep_transform_keys!(&camelize_lower)      
  end
 
  
end
