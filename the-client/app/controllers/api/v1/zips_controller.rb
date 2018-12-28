class Api::V1::ZipsController < ApplicationController
  include ZipModule

  before_action :set_zip

  # GET /zips/:zip
  def show
    json_response(@zipEstimates.to_json)
  end

  private

  def set_zip
    zip = params[:id]
    result = get_population_estimates(zip)
    if result.is_a?(Array) then
      respond_with_errors(result)
    else
      @zipEstimates = result
    end
  end

end
