# frozen_string_literal: true

require_relative './data_inserter'

class StoresInserter < DataInserter
  def insert
    company = Company.find_by(name: @data['企業名'],
                              ieul_company_id: @data['ieul_企業id'], logo_url: @data['ロゴURL'])
    prefecture = Prefecture.find_by(name: @data['都道府県'])
    city = City.find_by(name: @data['市区町村'], prefecture:)

    store = Store.new(ieul_store_id: @data['ieul_店舗id'], postal_code: @data['郵便番号'],
                      address: @data['以降住所'], phone_number: @data['電話番号'], fax_number: @data['FAX番号'],
                      business_duration: @data['営業時間'], regular_holiday: @data['定休日'],
                      introduction_text: @data['紹介文'], catch_copy: @data['キャッチコピー'],
                      company:, city:)
    store.name = case @data['店舗名']
                 when nil, ''
                   '本店'
                 else
                   @data['店舗名']
                 end
    store.save!
    @data['査定依頼可能エリア'].split(',', -1).each do |city_key|
      city = City.find(city_key.to_i)
      area = ValuationArea.new(store:, city:)
      area.save!
    end
  end
end

batch = StoresInserter.new
batch.insert_data
