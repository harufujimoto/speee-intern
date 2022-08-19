# frozen_string_literal: true

class Store < ApplicationRecord
  validates :ieul_store_id, :address, :introduction_text, :catch_copy, presence: true
  has_many :valuation_areas, dependent: :restrict_with_error
  # TODO: 口コミができたら口コミをhas_manyに足す
  belongs_to :company
end
