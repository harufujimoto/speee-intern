# frozen_string_literal: true

require 'csv'
require './csv_reader'

class ImportCompanies < CSVReader
  def insert
    ActiveRecord::Base.transaction do
      a_company = Company.new(name: @data['企業名'], ieul_company_id: @data['ieul_企業id'].to_i, logo_url: @data['ロゴURL'])
      a_company.save!
    end
  end
end

batch = ImportCompanies.new
batch.insert_data
