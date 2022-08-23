# frozen_string_literal: true

require 'net/http'

class EvaluationRequestsController < ApplicationController # rubocop:disable Style/Documentation
  def new
    @evaluation_request = EvaluationRequest.new
  end

  def create
    @evaluation_request = EvaluationRequest.new(evaluation_request_params)

    if @evaluation_request.post
      # TODO: thanksページへのリダイレクトを書く
    else
      render 'new'
    end
  end

  private

  def evaluation_request_params
    params.require(:evaluation_request).permit(:branch_id, :property_city, :property_address, :property_type,
                                               :property_exclusive_area, :property_land_area, :property_building_area,
                                               :property_building_area_unit, :property_floor_area, :url_param,
                                               :property_room_plan, :property_constructed_year, :user_email, :user_name,
                                               :user_name_kana, :user_tel)
  end
end
