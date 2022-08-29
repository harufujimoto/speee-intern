# frozen_string_literal: true

class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end

  def exist_store
    Store.eager_load(city: :prefecture).where(city: { prefecture: params[:id] }).present?
  end

  def show
    @cities = City.where(prefecture: params[:id])
    @prefecture = Prefecture.find(params[:id])
    @exist_store = Store.eager_load(city: :prefecture).where(city: { prefecture: params[:id] }).present?
  end

  helper_method :exist_store
end
