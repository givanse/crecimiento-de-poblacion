
class ZipController < ApplicationController
  include ZipModule

  def show 
    zip = params[:id]
    if zip.nil?
      render 'index'
      return
    end

    result = get_population_estimates(zip)
    puts result.class
    if result.is_a?(Array) then
      @errors = result
      @zipEstimates = nil
    else
      @errors = nil
      @zipEstimates = result
      
      p2014 = @zipEstimates[:data][:attributes][:p2014]
      p2015 = @zipEstimates[:data][:attributes][:p2015]
      delta = p2015 - p2014
      @annualGrowth = delta.to_f * 100 / p2014
    end

    render 'index'
  end

end
