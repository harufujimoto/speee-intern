# frozen_string_literal: true

require_relative './data_inserter'

class CitiesInserter < DataInserter
  def insert
    prefecture = Prefecture.find(@data['prefecture_id'])
    city = City.new(id: @data['id'], name: @data['name'], prefecture:)
    city.save!
  end
end

batch = CitiesInserter.new
batch.insert_data
