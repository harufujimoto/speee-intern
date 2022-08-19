# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true
  has_many :valuation_areas, dependent: :restrict_with_error
  has_many :stores, dependent: :restrict_with_error
  # TODO: has_many:口コミ
  belongs_to :prefecture
end
