class City < ApplicationRecord
  has_many :valuation_areas
  #TODO: has_many:口コミ
  belongs_to :prefecture
end
