# frozen_string_literal: true

FactoryBot.define do
  factory :prefecture do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "東京都-#{n}" }
  end
end
