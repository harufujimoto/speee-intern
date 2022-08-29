# frozen_string_literal: true

module PrefecturesHelper
  def exist_store(pref)
    Store.eager_load(city: :prefecture).where(city: { prefecture: pref.id }).present?
  end
end
