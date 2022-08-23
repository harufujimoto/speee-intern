# frozen_string_literal: true

require 'csv'
require './csv_reader'

class ImportCities < CSVReader
  def insert
    ActiveRecord::Base.transaction do
      a_prefecture = Prefecture.find(@data['prefecture_id'])
      a_city = City.new(name: @data['name'], prefecture: a_prefecture)
      a_city.save!
    end
  end
end

batch = ImportCities.new
batch.insert_data
