# frozen_string_literal: true

require 'date'

class ReviewsController < ApplicationController
  include ReviewsHelper

  def show
    @review = Review.eager_load(city: :prefecture, store: [:company, { city: :prefecture }]).find(params[:id])
    @store = @review.store

    @improvement_point = @review[:improvement_point] || '特になし'
    @sale_count = translate_sale_count(@review[:sale_count])
    @sale_reason = translate_sale_reason(@review[:sale_reason])
  end
end
