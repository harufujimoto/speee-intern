# frozen_string_literal: true

require 'date'

class ReviewsController < ApplicationController
  def translate_sale_count(sale_count)
    case sale_count
    when 'first'
      '初めて'
    when 'second'
      '2回め'
    else
      '3回以上'
    end
  end

  def translate_sale_reason(sale_reason)
    case sale_reason
    when 'migration'
      '住み替え'
    when 'inheritance'
      '相続'
    when 'relocation'
      '転勤、転職'
    when 'divorce'
      '離婚'
    when 'asset'
      '資産整理'
    when 'financial'
      '金銭的な理由'
    else
      'その他'
    end
  end

  def show
    @review = Review.eager_load(city: :prefecture, store: [:company, { city: :prefecture }]).find(params[:id])
    @store = @review.store

    @improvement_point = @review[:improvement_point] || '特になし'
    @sale_count = translate_sale_count(@review[:sale_count])
    @sale_reason = translate_sale_reason(@review[:sale_reason])
  end
end
