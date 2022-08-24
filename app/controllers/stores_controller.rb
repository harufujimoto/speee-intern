# frozen_string_literal: true

class StoresController < ApplicationController
  def index
    @city = City.includes(:prefecture).find(params[:city])
    @stores = Store.includes(:reviews, city: :prefecture).where(city: @city)
    @satisfaction_averages = Review.where(store: @stores).group(:store).average(:satisfaction)
    @cities = City.where(prefecture: @city.prefecture)
  end

  def show
    @store = Store.includes(:company, reviews: { city: :prefecture }, city: :prefecture).find(params[:id])
    @satisfaction_average = Review.average(:satisfaction)
  end
end
