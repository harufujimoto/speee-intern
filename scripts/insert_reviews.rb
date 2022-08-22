# frozen_string_literal: true

require 'csv'

# TODO: enum の値は0-basedになおす
# TODO: 性別[sex]:
# if @data["性別"] == "男性"
#
#

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
    a_city = City.find_by(name: @data['市区町村'])
    a_store = Store.find_by(ieul_store_id: @data['ieul_店舗id'])

    a_propertytype = PropertyType.new
    a_propertytype.property_type_name = @data['物件種別']

    a_review = Review.new(city: a_city, store: a_store, property_type: a_propertytype)

    a_review.name = @data['名前']
    # a_review.sex = if @data['性別'] == '男性'
    #                  0
    #                elsif @data['性別'] == '女性'
    #                  1
    #                else
    #                  2
    #                end
    a_review.sex = case @data['性別']
                   when '男性'
                     0
                   when '女性'
                     1
                   else
                     2
                   end

    a_review.age = @data['年齢']

    # a_review.sale_count = if @data['売却回数'] == '初めて'
    #                         0
    #                       elsif @data['売却回数'] == '2回目'
    #                         1
    #                       else
    #                         2
    #                       end
    a_review.sale_count = case @data['売却回数']
                          when '初めて'
                            0
                          when '2回目'
                            1
                          else
                            2
                          end

    a_review.sale_consideration_at = @data['売却検討時期']
    a_review.evaluation_request_at = @data['査定依頼時期']
    a_review.sale_at = @data['売出時期']
    a_review.delivery_at = @data['引渡時期']
    a_review.evaluation_price = @data['査定価格']
    a_review.sale_price = @data['販売価格']

    a_review.address = @data['住所全部']
    a_review.launch_at = @data['売出時期']
    a_review.advice = @data['今後売却する人へのアドバイス']
    a_review.improvement_point = @data['不動産会社に改善してほしい点']

    a_review.price_cut = (@data['値下げしたかどうか'] != '0')

    a_review.price_cut_month = @data['売り出してから何ヶ月後に値下げしたか']
    a_review.price_cut_range = @data['値下げ価格']
    a_review.closing_price = @data['成約価格']
    a_review.contract_type = @data['媒介契約の形態'].to_i - 1
    a_review.headline = @data['見出し']
    # if a_review.sale_reason == "99"
    #   a_review.sale_reason = 6
    # end
    a_review.sale_reason = if @data['売却理由'] == '99'
                             6
                           else
                             @data['売却理由'].to_i - 1
                           end
    # a_review.sale_reason = @data["売却理由"].to_i - 1
    a_review.worried = @data['売却時に不安だったこと']
    a_review.decision_reason = @data['この会社に決めた理由']
    a_review.satisfaction = @data['不動産会社の対応満足度']
    a_review.satisfaction_reason = @data['不動産会社の対応満足度の理由']
    # a_review.advice = @data["今後売却する人へのアドバイス"]
    # a_review.improvement_point = @data["不動産会社に改善してほしい点"]

    # puts a_review.valid?
    puts a_review.errors.full_messages
    a_review.save
  end
end

batch = Batch.new
batch.insert_data

puts 'end of program'
