# frozen_string_literal: true

require_relative './csv_reader'

class ImportStores < CSVReader
  def insert
    a_company = Company.find_by(name: @data['企業名'],
                                ieul_company_id: @data['ieul_企業id'], logo_url: @data['ロゴURL'])
    a_prefecture = Prefecture.find_by(name: @data['都道府県'])
    a_city = City.find_by(name: @data['市区町村'], prefecture: a_prefecture)

    a_store = Store.new(name: @data['店舗名'], ieul_store_id: @data['ieul_店舗id'], postal_code: @data['郵便番号'],
                        address: @data['以降住所'], phone_number: @data['電話番号'], fax_number: @data['FAX番号'],
                        business_duration: @data['営業時間'], regular_holiday: @data['定休日'],
                        introduction_text: @data['紹介文'], catch_copy: @data['キャッチコピー'],
                        company: a_company, city: a_city)
    a_store.save!
    @data['査定依頼可能エリア'].split(',', -1).each do |city_key|
      a_city = City.find(city_key.to_i)
      a_area = ValuationArea.new(store: a_store, city: a_city)
      a_area.save!
    end
  end
end

batch = ImportStores.new
batch.insert_data
