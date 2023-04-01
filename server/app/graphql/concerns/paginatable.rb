module Paginatable
  extend ActiveSupport::Concern

  module PagyType
    def pagy_type(metadata_type: ::Types::BaseScalar)
      @pagy_types ||= {}
      @pagy_types[metadata_type] ||= begin
        type_name = "#{graphql_name}Pagination"
        source_type = self

        Class.new(GraphQL::Schema::Object) do
          graphql_name type_name
          field :collection, [source_type], null: false, description: "Data Collection"
          field :metadata, metadata_type, null: false, description: "Metadata"

          def collection
            object.first
          end

          def metadata
            object.last
          end
        end
      end
    end
  end

  private

  def pagy(collection, options = {})
    max_per_page = 100
    default_per_page = 30
    per_page = options[:per_page].presence || default_per_page
    per_page = max_per_page if per_page > max_per_page
    page = options[:page].presence || 1

    count = collection.select(:id).count
    pages = last = [(count.to_f / per_page).ceil, 1].max
    if page <= last
      offset = (per_page * (page - 1)) + options[:outset].to_i
      items = if page == last
                count - ((pages - 1) * per_page)
              else
                per_page
              end
      prev_page = page - 1 unless page == 1
      next_page = page == last ? (1 if options[:cycle]) : (page + 1)
      [
        collection.offset(offset).limit(items),
        {
          count: count,
          per_page: per_page,
          page: page,
          outset: options[:outset].to_i,
          pages: pages,
          items: items,
          next: next_page,
          prev: prev_page,
          from: count.zero? ? 0 : offset + 1 - options[:outset].to_i,
          to: count.zero? ? 0 : offset + items - options[:outset].to_i,
        },
      ]
    else
      raise PaginationError.new
    end
  end
end
