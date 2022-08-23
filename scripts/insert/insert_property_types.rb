# frozen_string_literal: true

require_relative './csv_reader'

class ImportPropertyTypes < CSVReader
  def insert
    property_type = PropertyType.new(name: @data['typename'])
    property_type.save!
  end
end

batch = ImportPropertyTypes.new
batch.insert_data
