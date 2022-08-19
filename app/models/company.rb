# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :stores, dependent: :restrict_with_error
end
