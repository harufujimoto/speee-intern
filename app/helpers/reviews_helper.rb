# frozen_string_literal: true

module ReviewsHelper
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
end
