# frozen_string_literal: true

# TODO: (あとでやる、１スプリントではやらない)... データの挿入の時にUNIQUE制約をかけたり、重複データを弾く処理をつける

require_relative './csv_reader'

class ImportReviews < CSVReader
  def insert
    city = City.find_by(name: @data['市区町村'])
    store = Store.find_by(ieul_store_id: @data['ieul_店舗id'])
    property_type = PropertyType.find_by(name: @data['物件種別'])

    review = Review.new(city:, store:, property_type:)
    review.name = @data['名前']
    review.age = @data['年齢']
    review.sale_consideration_at = @data['売却検討時期']
    review.evaluation_request_at = @data['査定依頼時期']
    review.sale_at = @data['売出時期']
    review.delivery_at = @data['引渡時期']
    review.evaluation_price = @data['査定価格']
    review.sale_price = @data['販売価格']
    review.address = @data['住所全部']
    review.launch_at = @data['売出時期']
    review.advice = @data['今後売却する人へのアドバイス']
    review.improvement_point = @data['不動産会社に改善してほしい点']
    review.price_cut = (@data['値下げしたかどうか'] != '0')
    review.price_cut_month = @data['売り出してから何ヶ月後に値下げしたか']
    review.price_cut_range = @data['値下げ価格']
    review.closing_price = @data['成約価格']
    review.headline = @data['見出し']
    review.worried = @data['売却時に不安だったこと']
    review.decision_reason = @data['この会社に決めた理由']
    review.satisfaction = @data['不動産会社の対応満足度']
    review.satisfaction_reason = @data['不動産会社の対応満足度の理由']

    # enumデータの挿入
    review.contract_type = @data['媒介契約の形態'].to_i - 1
    review.sex = case @data['性別']
                 when '男性'
                   Review.sexes[:male]
                 when '女性'
                   Review.sexes[:female]
                 else
                   Review.sexes[:unknown]
                 end
    review.sale_count = case @data['売却回数']
                        when '初めて'
                          Review.sale_counts[:first]
                        when '2回目'
                          Review.sale_counts[:second]
                        else
                          Review.sale_counts[:more]
                        end
    review.sale_reason = case @data['売却理由']
                         when '99'
                           Review.sale_reasons[:other]
                         else
                           @data['売却理由'].to_i - 1
                         end

    review.save!
  end
end

batch = ImportReviews.new
batch.insert_data
