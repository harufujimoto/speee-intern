# frozen_string_literal: true

require_relative './csv_reader'

class ImportCompanies < CSVReader
  def insert
    company = Company.new(name: @data['企業名'], ieul_company_id: @data['ieul_企業id'].to_i, logo_url: @data['ロゴURL'])
    company.save!
  end
end

batch = ImportCompanies.new
batch.insert_data
