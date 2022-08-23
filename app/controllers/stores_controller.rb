# frozen_string_literal: true

class StoresController < ApplicationController
  def show
    @store = Store.includes(:company, reviews: { city: :prefecture }, city: :prefecture).find(params[:id])
    @satisfaction_average = Review.average(:satisfaction)
  end
end
