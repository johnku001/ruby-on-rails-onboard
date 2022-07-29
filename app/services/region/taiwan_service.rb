class Region::TaiwanService < ApplicationService
  attr_reader :region_params

  def initialize(params)
      @region_params = params
  end

  def call
    if region_params[:region] == "taiwan"
      "I am from Taiwan"
    else
      "I am not from Taiwan"
    end
  end
end

