require 'csv'

class Batch
  def initialize
    @csv_path = ARGV.first
    @data = nil
  end

  def insert_data
    return if @csv_path == ''

    CSV.foreach(@csv_path, headers: true) do |row|
      # @user.attributes = row.to_hash.slice(*updatable_attributes)
      # @user.save
      # puts row.to_hash
      @data = row.to_hash
      insert
    end
  end

  def insert
    insert_company
    insert_city
    insert_store
    insert_prefecture
    insert_valuation_area
  end

  def insert_company
    # puts @data["企業名"]
    a_company = Company.new(name: @data["企業名"], ieul_company_id: @data["ieul_企業id"], logo_url: @data["ロゴURL"])
    # puts a_company.valid?
  end

  def insert_city
    # a_city = City.new()
  end

  def insert_store

  end

  def insert_prefecture

  end

  def insert_valuation_area

  end
end

batch = Batch.new
batch.insert_data
