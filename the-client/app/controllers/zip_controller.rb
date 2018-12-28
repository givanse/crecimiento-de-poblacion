
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
    end

    render 'index'
  end

end
