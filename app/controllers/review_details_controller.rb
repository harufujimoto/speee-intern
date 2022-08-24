# frozen_string_literal: true

require 'date'

class ReviewDetailsController < ApplicationController
  def show
    @review = Review.includes(city: :prefecture, store: [:company, { city: :prefecture }]).find(params[:id])

    @improvement_point = @review[:improvement_point] || '特になし'
    @sale_count = case @review[:sale_count]
                  when 'first'
                    '初めて'
                  when 'second'
                    '2回め'
                  else
                    '3回以上'
                  end
    @sale_reason = case @review[:sale_reason]
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
end
