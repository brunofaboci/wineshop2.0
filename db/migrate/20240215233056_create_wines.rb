# frozen_string_literal: true

# class that create wine table
class CreateWines < ActiveRecord::Migration[7.1]
  def change
    create_table :wines do |t|
      t.string :winery, null: false, limit: 100
      t.string :name, null: false, limit: 100
      t.string :wine_type, null: false, limit: 25
      t.string :location, null: false, limit: 100
      t.string :image_url, limit: 255
      t.string :average_rating, limit: 25

      t.timestamps
    end
  end
end
