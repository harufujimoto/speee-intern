# frozen_string_literal: true

class PropertyType < ApplicationRecord
  validates :property_type_name, presence: true

  has_many :reviews, dependent: :restrict_with_error
end
