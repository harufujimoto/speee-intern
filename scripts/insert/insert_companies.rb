# frozen_string_literal: true

require_relative './data_inserter'

class CompaniesInserter < DataInserter
  def insert
    company = Company.new(name: @data['企業名'], ieul_company_id: @data['ieul_企業id'].to_i, logo_url: @data['ロゴURL'])
    company.save!
  end
end

batch = CompaniesInserter.new
batch.insert_data
