# frozen_string_literal: true

class EvaluationRequest
  include ActiveModel::Model

  attr_accessor :branch_id, :property_city, :property_address, :property_type, :property_exclusive_area,
                :property_land_area, :property_building_area, :property_building_area_unit, :property_floor_area,
                :url_param, :property_room_plan, :property_constructed_year, :user_email, :user_name, :user_name_kana,
                :user_tel

  VALID_USER_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_USER_NAME = /\S+ \S+/
  VALID_USER_TEL_REGEX = /\A0\d{9,10}/

  validates :branch_id, presence: true
  validates :property_city, presence: true
  validates :property_address, presence: true
  validates :property_type, presence: true, numericality: { in: 1..3 }
  validates :property_exclusive_area, presence: true, numericality: true
  validates :property_land_area, presence: true, numericality: true
  validates :property_building_area, presence: true, numericality: true
  validates :property_building_area_unit, presence: true, numericality: { in: 1..2 }
  validates :property_floor_area, presence: true, numericality: true
  validates :url_param, presence: true
  validates :property_room_plan, presence: true, numericality: { in: 1..13 }
  validates :property_constructed_year, presence: true, numericality: { in: 1925..2016 }
  validates :user_email, presence: true, format: { with: VALID_USER_EMAIL }, length: { maximum: 100 }
  validates :user_name, presence: true, format: { with: VALID_USER_NAME }
  validates :user_name_kana, presence: true, format: { with: VALID_USER_NAME }
  validates :user_tel, presence: true, format: { with: VALID_USER_TEL_REGEX }

  def post
    return false if invalid?

    uri = URI.parse('https://miniul-api.herokuapp.com/affiliate/v2/conversions')
    params = { branch_id:, property_city:, property_address:, property_type:, property_exclusive_area:,
               property_land_area:, property_building_area:, property_building_area_unit:, property_floor_area:,
               url_param:, property_room_plan:, property_constructed_year:, user_email:, user_name:, user_name_kana:,
               user_tel: }
    response = Net::HTTP.post_form(uri, params)
    response.code == '200'
  end
end
