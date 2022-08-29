# frozen_string_literal: true

class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end

  def show
    @cities = City.where(prefecture: params[:id])
    @prefecture = Prefecture.find(params[:id])
    @stores = Store.eager_load(city: :prefecture).where(city: { prefecture: params[:id] })
  end
end
