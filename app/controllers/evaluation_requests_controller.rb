# frozen_string_literal: true

require 'net/http'

class EvaluationRequestsController < ApplicationController
  def new
    @evaluation_request = EvaluationRequest.new
    @ieul_store_id = params[:ieul_store_id]
    @store = Store.includes(valuation_areas: :city).find_by(ieul_store_id: @ieul_store_id)
  end

  def create
    @evaluation_request = EvaluationRequest.new(evaluation_request_params)

    if @evaluation_request.post
      redirect_to thanks_path
    else
      @ieul_store_id = @evaluation_request.branch_id
      @store = Store.includes(valuation_areas: :city).find_by(ieul_store_id: @ieul_store_id)
      render 'new'
    end
  end

  private

  def evaluation_request_params
    params.require(:evaluation_request).permit(:branch_id, :property_city, :property_address, :property_type,
                                               :property_exclusive_area, :property_land_area, :property_building_area,
                                               :property_building_area_unit, :property_floor_area, :url_param,
                                               :property_room_plan, :property_constructed_year, :user_email, :user_name_last,
                                               :user_name_first, :user_name_last_kana, :user_name_first_kana, :user_tel)
  end
end
