# frozen_string_literal: true

class StoresController < ApplicationController # rubocop:disable Style/Documentation
  def show
    @store = Store.find(params[:id])
    @satisfaction_average = Review.average(:satisfaction)
  end
end
