# frozen_string_literal: true

module PrefecturesHelper
  def exist_store(cities)
    res = false
    cities.each do |city|
      res = true if city.stores.present?
    end
    res
  end
end
