class Store < ApplicationRecord
  has_many :valuation_areas
  #TODO: 口コミができたら口コミをhas_manyに足す
end
