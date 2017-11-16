class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def generate_slug(property)
    self.slug ||= property.parameterize if property;
  end

end
