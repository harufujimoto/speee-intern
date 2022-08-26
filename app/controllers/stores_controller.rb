# frozen_string_literal: true

class StoresController < ApplicationController
  def index
    @city = City.eager_load(:prefecture).find(params[:city])
    @stores = Store.includes(:reviews, city: :prefecture).where(city: @city)
    @satisfaction_averages = Review.where(store: @stores).group(:store).average(:satisfaction)
    @cities = City.where(prefecture: @city.prefecture)
  end

  def show
    @store = Store.includes(:company, reviews: { city: :prefecture }, city: :prefecture).find(params[:id])
    @company = @store.company
    @satisfaction_average = Review.where(store: @store).average(:satisfaction)
    @review = @store.reviews.page(params[:page]).per(1)
  end
end
