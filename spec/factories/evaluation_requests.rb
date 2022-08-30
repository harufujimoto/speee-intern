# frozen_string_literal: true

FactoryBot.define do
  factory :evaluation_request do
    branch_id { 1 }
    property_city { 660 }
    property_address { '品川2丁目' }
    property_type { 1 }
    property_exclusive_area { 100 }
    property_land_area { 100 }
    property_building_area { 100 }
    property_building_area_unit { 1 }
    property_floor_area { 100 }
    url_param { 'サーテイン' }
    property_room_plan { 1 }
    property_constructed_year { 2000 }
    user_email { 'example@example.com' }
    user_name_first { '服部' }
    user_name_last { '彩' }
    user_name_first_kana { 'はっとり' }
    user_name_last_kana { 'あや' }
    user_tel { '0300000000' }
  end
end
