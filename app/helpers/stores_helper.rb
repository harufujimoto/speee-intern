# frozen_string_literal: true

module StoresHelper
  def get_ymformat(date)
    y = date.strftime('%Y')
    m = case date.strftime('%m')[0]
        when '0'
          date.strftime('%m').slice(1)
        else
          date.strftime('%m')
        end
    "#{y}年#{m}月"
  end

  def insert_comma(cost)
    str = cost.to_s
    len = str.length
    if len <= 3
      str
    else
      "#{insert_comma(str.slice(0..len - 4))},#{insert_comma(str.slice(len - 3..len - 1))}"
    end
  end

  def get_cost_format(cost)
    if cost < 10_000
      cost
    elsif cost >= 100_000_000
      "#{insert_comma(cost / 100_000_000)}億円"
    else
      "#{insert_comma(cost / 10_000)}万円"
    end
  end
end
