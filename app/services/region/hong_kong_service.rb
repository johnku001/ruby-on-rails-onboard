class Region::HongKongService < ApplicationService
  attr_reader :region_params

  def initialize(params)
      @region_params = params
  end

  def call
    if region_params[:region] == "hong_kong"
      "I am from Hong Kong"
    else
      "I am not from Hong Kong"
    end
  end
end

