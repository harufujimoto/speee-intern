# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    @city = City.eager_load(:prefecture).find(params[:id])
    @stores = Store.eager_load(:reviews, city: :prefecture).where(city: @city)
    @satisfaction_averages = Review.where(store: @stores).group(:store).average(:satisfaction)
    @cities = City.eager_load(:prefecture).where(prefecture: @city.prefecture)
  end
end
