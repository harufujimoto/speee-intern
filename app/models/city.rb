# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true
  has_many :valuation_areas, dependent: :restrict_with_error
  has_many :stores, dependent: :restrict_with_error
  has_many :reviews, dependent: :restrict_with_error
  belongs_to :prefecture
end
