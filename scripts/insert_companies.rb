require 'csv'

class BatchCompanies
  def initialize
    @csv_path = ARGV.first
    @data_review = nil
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
    a_company = Company.new(name: @data['企業名'],
                            ieul_company_id: @data['ieul_企業id'], logo_url: @data['ロゴURL'])
    a_prefecture = Prefecture.new(name: @data['都道府県'])
    a_city = City.new(name: @data['市区町村'], prefecture: a_prefecture)
    a_store = Store.new(name: @data['店舗名'], ieul_store_id: @data['ieul_店舗id'], postal_code: @data['郵便番号'],
                        address: @data['以降住所'], phone_number: @data['電話番号'], fax_number: @data['FAX番号'],
                        business_duration: @data['営業時間'], regular_holiday: @data['定休日'],
                        introduction_text: @data['紹介文'], catch_copy: @data['キャッチコピー'],
                        company: a_company, city: a_city)
    a_valuation_area = ValuationArea.new(city: a_city, store: a_store)

    # puts a_company.valid? && a_prefecture.valid? && a_city.valid? && a_store.valid? && a_valuation_area.valid?
    a_company.save
    a_prefecture.save
    a_city.save
    a_store.save
    a_valuation_area.save
  end
end

batch = BatchCompanies.new
batch.insert_data
