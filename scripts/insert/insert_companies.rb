# frozen_string_literal: true

require_relative './data_inserter'

class CompaniesInserter < DataInserter
  def insert
    company = Company.find_or_initialize_by(name: @data['企業名'], ieul_company_id: @data['ieul_企業id'].to_i,
                                            logo_url: @data['ロゴURL'])
    company.save! if company.new_record?
  end
end

batch = CompaniesInserter.new
batch.insert_data
