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
      a_company = Company.new(name: @data['企業名'], ieul_company_id: @data['ieul_企業id'].to_i, logo_url: @data['ロゴURL'])
      a_company.save!
    end
  end
end

batch = BatchCompanies.new
batch.insert_data
