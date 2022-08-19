require 'csv'

# TODO: enum の値は0-basedになおす

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
    insert_store
    insert_review
    insert_prefecture
    insert_city
    insert_property_type
  end

  def insert_company
    # puts @data["企業名"]
    a_company = Company.new(name: @data["企業名"], ieul_company_id: @data["ieul_企業id"], logo_url: @data["ロゴURL"])
    # puts a_company.valid?
  end

  def insert_store
    a_store = Store.new(
      name: @data["店舗名"]
    )
  end

  def insert_review

  end

  def insert_prefecture

  end

end

batch = Batch.new
batch.insert_data
