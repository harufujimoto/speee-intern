# frozen_string_literal: true

class StoresController < ApplicationController
  def show
    @store = Store.includes(:company, reviews: { city: :prefecture }, city: :prefecture).find(params[:id])
    @company = @store.company
    @satisfaction_average = Review.where(store: @store).average(:satisfaction)
  end
end
