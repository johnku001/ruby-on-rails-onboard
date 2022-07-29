class Region::ChinaService < ApplicationService
  attr_reader :region_params

  def initialize(params)
      @region_params = params
  end

  def call
    if region_params[:region] == "china"
      "I am from China"
    else
      "I am not from China"
    end
  end
end

