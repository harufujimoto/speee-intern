# frozen_string_literal: true

class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end

  def show
    @cities = City.where(prefecture: params[:id])
  end
end