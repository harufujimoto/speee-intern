# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    name { '服部 彩' }
    sex { Review.sexes[:female] }
    age { 46 }
    address { '品川2丁目' }
    sale_count { Review.sale_counts[:first] }
    sale_consideration_at { '2018-02-14' }
    evaluation_request_at { '2018-03-14' }
    launch_at { '2018-03-14' }
    sale_at { '2019-01-14' }
    delivery_at { '2019-07-31' }
    evaluation_price { 22_000_000 }
    sale_price { 22_500_000 }
    price_cut { true }
    price_cut_month { 3 }
    price_cut_range { 500_000 }
    closing_price { 17_000_000 }
    contract_type { Review.contract_types[:fulltime] }
    headline { '当方の都合を汲んで丁寧に対応してくれ、別件購入も行った。' }
    sale_reason { Review.sale_reasons[:asset] }
    worried { '築年数が古いため、そもそも売却出来るのか、という点。' }
    decision_reason { '担当者は若かったがやる気があり、上司も一緒にきたので安心感があった。名義人五人分の資料を作成してくれて送ってくれたのも良かった。' }
    satisfaction { 5 }
    satisfaction_reason { '先に述べたように、購入（投資物件）にも対応してくれたこと。' }
    advice { '私の場合、１年を超える作業になりましたが、性急すぎない期間の目安を持つこと。' }
    improvement_point { nil }
  end
end
