class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def camelize_lower_json(as_json_options = nil)
    camelize_lower = Proc.new {|a| a.camelize(:lower)}
    json_hash = self.as_json(as_json_options)
    json_hash.deep_transform_keys!(&camelize_lower)      
  end
end
