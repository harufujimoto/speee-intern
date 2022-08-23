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

# sample implementation
# class BatchCompanies << Batch
# def insert
#   a_prefecture = Prefecture.new(name: @data['name'])
#   a_prefecture.save!
# end
# end
# batch = BatchCompanies.new
# batch.insert_data
