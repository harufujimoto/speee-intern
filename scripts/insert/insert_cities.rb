# frozen_string_literal: true

require_relative './csv_reader'

class ImportCities < CSVReader
  def insert
    a_prefecture = Prefecture.find(@data['prefecture_id'])
    a_city = City.new(name: @data['name'], prefecture: a_prefecture)
    a_city.save!
  end
end

batch = ImportCities.new
batch.insert_data
