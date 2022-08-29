# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    name { '品川支店' }
    ieul_store_id { 1 }
    postal_code { '329-1224' }
    address { '品川2丁目' }
    phone_number { '03-0000-0000' }
    fax_number { '03-0000-0000' }
    business_duration { '平日9:00～18:00' }
    regular_holiday { '水曜日、祝日、GW、他' }
    introduction_text { '不動産の売却はあんず不動産にお任せください' }
    catch_copy { 'あんず不動産品川支店にお任せください！東京都の不動産売却の実績多数です。' }
  end
end
