# frozen_string_literal: true

require 'csv'
class CSVReader
  def initialize
    @csv_path = ARGV.first
    @data_review = nil
  end

  def insert_data
    CSV.foreach(@csv_path, headers: true) do |row|
      @data = row.to_hash
      ActiveRecord::Base.transaction do
        insert
      end
    end
  end

  def insert
    puts 'batch: base class.'
  end
end

