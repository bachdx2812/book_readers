class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  class << self
    def ransackable_attributes(_auth_object = nil)
      self.columns.map(&:name) - non_searchables_columns
    end

    def non_searchables_columns
      []
    end

    def ransackable_associations(_auth_object = nil)
      self.reflections.map(&:first) - non_searchables_relations
    end

    def non_searchables_relations
      # E.g: book has_many genres -> "genres"
      []
    end
  end
end
