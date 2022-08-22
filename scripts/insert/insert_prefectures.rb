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
      a_prefecture = Prefecture.new(name: @data['name'])
      a_prefecture.save!
    end
  end
end

batch = BatchCompanies.new
batch.insert_data
