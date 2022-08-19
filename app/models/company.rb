# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true
  validates :ieul_company_id, presence: true
  validates :logo_url, presence: true
  has_many :stores, dependent: :restrict_with_error
end
