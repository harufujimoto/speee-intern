# frozen_string_literal: true

class PropertyType < ApplicationRecord
  validates :name, presence: true
  has_many :reviews, dependent: :restrict_with_error
end
