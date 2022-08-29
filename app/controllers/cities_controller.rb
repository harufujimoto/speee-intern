# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    @city = City.eager_load(:prefecture).find(params[:id])
    @stores = Store.eager_load(:reviews, city: :prefecture).where(city: @city)
    @paginated_stores = @stores.page(params[:page]).per(1)
    @satisfaction_averages = Review.where(store: @stores).group(:store).average(:satisfaction)
    @cities = City.where(prefecture: @city.prefecture)
  end
end
