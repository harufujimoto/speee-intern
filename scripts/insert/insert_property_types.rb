# frozen_string_literal: true

require_relative './data_inserter'

class PropertyTypesInserter < DataInserter
  def insert
    property_type = PropertyType.new(name: @data['typename'])
    property_type.save!
  end
end

batch = PropertyTypesInserter.new
batch.insert_data
