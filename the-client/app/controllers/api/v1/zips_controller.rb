
class Api::V1::ZipsController < ApplicationController
  before_action :set_zip

  # GET /zips/:zip
  def show
    response = {
      :data => {
        :type => 'zip',
        :id => @zip.zip,
        :attributes => {
          :msaName => @zip.msaName,
          :cbsa => @zip.cbsa,
          :p2014 => @zip.p2014,
          :p2015 => @zip.p2015,
        }
      },
    }
    json_response(response.to_json)
  end

  def is_valid_zip(zip)
    return /^[0-9]{5}(?:-[0-9]{4})?$/ =~ zip
  end

  private

  def respond_with_errors(objects)
      response = {
        :errors => []
      }

      objects.each do |object|
        error = {
          :status => object[:status],
          :title => object[:title],
          :detail => object[:detail], 
        }
        response[:errors].push(error)
      end

      json_response(response.to_json, 400)
  end

  def set_zip
    zip = params[:id]
    unless is_valid_zip zip then
      object = {
        :status => 422,
        :title => 'not a valid zip code',
        :detail => 'the value `' + zip + '` is not a zip code',
      }
      respond_with_errors([object])
      return
    end

    @zip = Zip.find_by zip: zip

    unless @zip then
      object = {
        :status => 404,
        :title => 'zip code not found',
        :detail => 'the zip code`' + zip + '` is not in our records',
      }
      respond_with_errors([object])
    end
  end

end
