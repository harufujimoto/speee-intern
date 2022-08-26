# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { 'あんず不動産' }
    ieul_company_id { 1 }
    logo_url { 'https://foodslink.jp/syokuzaihyakka/syun/fruit/abricotto/anzu21s.jpg' }
  end
end
