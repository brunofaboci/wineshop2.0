# frozen_string_literal: true

# class that manage wines records
class WinesController < ApplicationController
  def index
    wines = Wine.pagy_search(params[:query])
    @pagy, @wines = pagy_meilisearch(wines, items: 10)
  end
end

# Wine.search('italy', filter: ['wine_type=red'], sort: ['created_at:desc'])
