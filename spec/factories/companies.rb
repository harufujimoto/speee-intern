# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { 'あんず不動産' }
    ieul_company_id { 1 }
    logo_url { 'https://example.com' }
  end
end
