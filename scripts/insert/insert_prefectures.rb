# frozen_string_literal: true

require_relative './csv_reader'
class ImportPrefectures < CSVReader
  def insert
    ActiveRecord::Base.transaction do
      a_prefecture = Prefecture.new(name: @data['name'])
      a_prefecture.save!
    end
  end
end

batch = ImportPrefectures.new
batch.insert_data
