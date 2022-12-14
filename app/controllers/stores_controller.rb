# frozen_string_literal: true

class StoresController < ApplicationController
  def show
    @store = Store.includes(:company, reviews: { city: :prefecture }, city: :prefecture).find(params[:id])
    @company = @store.company
    @satisfaction_average = Review.where(store: @store).average(:satisfaction)
    @reviews = @store.reviews.page(params[:page]).per(5)
  end
end
