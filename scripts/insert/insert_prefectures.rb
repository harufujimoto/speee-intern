# frozen_string_literal: true

require_relative './csv_reader'

class ImportPrefectures < CSVReader
  def insert
    prefecture = Prefecture.new(id: @data['id'], name: @data['name'])
    prefecture.save!
  end
end

batch = ImportPrefectures.new
batch.insert_data
