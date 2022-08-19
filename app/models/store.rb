# frozen_string_literal: true

class Store < ApplicationRecord
  validates :ieul_store_id, presence: true
  validates :address, presence: true
  validates :introduction_text, presence: true
  validates :catch_copy, presence: true
  has_many :valuation_areas, dependent: :restrict_with_error
  has_many :reviews, dependent: :restrict_with_error
  belongs_to :company
  belongs_to :city
end
