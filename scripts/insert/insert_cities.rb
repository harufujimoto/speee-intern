# frozen_string_literal: true

require 'csv'

class BatchCompanies
  def initialize
    @csv_path = ARGV.first
    @data_review = nil
  end

  def insert_data
    @csv_path.blank?

    CSV.foreach(@csv_path, headers: true) do |row|
      @data = row.to_hash
      insert
    end
  end

  def insert
    ActiveRecord::Base.transaction do
      a_prefecture = Prefecture.find(@data['prefecture_id'])
      a_city = City.new(name: @data['name'], prefecture: a_prefecture)
      a_city.save!
    end
  end
end

batch = BatchCompanies.new
batch.insert_data
