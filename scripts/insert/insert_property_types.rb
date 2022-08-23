# frozen_string_literal: true

require 'csv'
require './csv_reader'

class ImportPropertyTypes < CSVReader
  def insert
    ActiveRecord::Base.transaction do
      a_property_type = PropertyType.new(property_type_name: @data['typename'])
      a_property_type.save!
    end
  end
end

batch = ImportPropertyTypes.new
batch.insert_data
