# frozen_string_literal: true

# class that manage Wines objects
class Wine < ApplicationRecord
  include MeiliSearch::Rails
  extend Pagy::Meilisearch
  ActiveRecord_Relation.include Pagy::Meilisearch

  SEARCH_SYNONYMS = {
    red: %w[tinto],
    tinto: %w[red],
    white: %w[branco],
    branco: %w[white],
    sparkling: %w[espumante],
    espumante: %w[sparkling]
  }.freeze

  RED       = 'reds'
  ROSE      = 'rose'
  WHITE     = 'whites'
  SPARKLING = 'sparkling'

  meilisearch do
    attribute %i[winery name wine_type location]
    attribute :average_rating do
      average_rating.to_f
    end

    searchable_attributes %i[winery name wine_type location]

    filterable_attributes %i[wine_type]

    sortable_attributes %i[created_at updated_at average_rating]

    synonyms SEARCH_SYNONYMS
  end

  validates :winery, :name, :wine_type, :location, presence: true
end
