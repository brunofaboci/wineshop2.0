# frozen_string_literal: true

# class that create wines
class CreateWinesService
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def create
    wines = GetWinesService.new(type).search

    ActiveRecord::Base.transaction do
      wines.each do |wine|
        create_wine(wine)
      end
    end
  end

  private

  def create_wine(wine)
    Wine.create!(
      winery: wine[:winery].present? ? wine[:winery] : 'not informed',
      name: wine[:wine].present? ? wine[:wine] : 'not informed',
      wine_type: type.singularize,
      location: wine[:location].present? ? wine[:location] : 'not informed',
      image_url: wine[:image],
      average_rating: wine.dig(:rating, :average)
    )
  end
end
