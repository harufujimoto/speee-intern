# frozen_string_literal: true

require 'csv'

class CSVReader
  def initialize
    @csv_path = ARGV.first
    @data = nil
  end

  def insert_data
    ActiveRecord::Base.transaction do
      CSV.foreach(@csv_path, headers: true) do |row|
        @data = row.to_hash
        insert
      end
    end
  rescue StandardError => e
    puts 'failed to insert'
    puts e
  end

  def insert
    puts 'batch: base class.'
  end
end
