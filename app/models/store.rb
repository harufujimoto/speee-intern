# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :valuation_areas, dependent: :restrict_with_error
  # TODO: 口コミができたら口コミをhas_manyに足す
  belongs_to :company
end
