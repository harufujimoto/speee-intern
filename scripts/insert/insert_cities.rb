# frozen_string_literal: true

require_relative './csv_reader'

class ImportCities < CSVReader
  def insert
    prefecture = Prefecture.find(@data['prefecture_id'])
    city = City.new(name: @data['name'], prefecture:)
    city.save!
  end
end

batch = ImportCities.new
batch.insert_data
