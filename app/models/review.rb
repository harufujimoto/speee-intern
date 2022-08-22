# frozen_string_literal: true

class Review < ApplicationRecord
  validates :name, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :sale_count, presence: true
  validates :sale_consideration_at, presence: true
  validates :evaluation_request_at, presence: true
  validates :launch_at, presence: true
  validates :sale_at, presence: true
  validates :delivery_at, presence: true
  validates :evaluation_price, presence: true
  validates :sale_price, presence: true
  validates :price_cut, presence: true
  validates :closing_price, presence: true
  validates :contract_type, presence: true
  validates :headline, presence: true
  validates :sale_reason, presence: true
  validates :worried, presence: true
  validates :decision_reason, presence: true
  validates :satisfaction, presence: true
  validates :satisfaction_reason, presence: true
  validates :advice, presence: true
  validates :improvement_point, presence: true

  enum sex: { male: 0, female: 1, unknown: 2 }, prefix: true
  enum sale_count: { first: 0, second: 1, more: 2 }, prefix: true
  enum contract_type: { exclusive_fulltime: 0, fulltime: 1, general: 2, unknown: 3 }, _prefix: true
  enum sale_reason: { migration: 0, inheritance: 1, relocation: 2, divorce: 3, asset: 4, financial: 5, other: 6 },
       prefix: true

  belongs_to :property_type
  belongs_to :store
  belongs_to :city
end
