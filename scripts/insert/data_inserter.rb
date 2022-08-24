# frozen_string_literal: true

require 'csv'

class DataInserter
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
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique, ActiveRecord::RecordNotFound => e
    puts e
    puts 'transaction failed.......'
  end

  def insert
    raise NotImplementedError
  end
end
