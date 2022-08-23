# frozen_string_literal: true

require_relative './data_inserter'

class PrefecturesInserter < DataInserter
  def insert
    prefecture = Prefecture.new(id: @data['id'], name: @data['name'])
    prefecture.save!
  end
end

batch = PrefecturesInserter.new
batch.insert_data
