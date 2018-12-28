
module ZipModule

  def is_valid_zip(zip)
    return /^[0-9]{5}(?:-[0-9]{4})?$/ =~ zip
  end

  def get_population_estimates(zip)
    unless is_valid_zip zip then
      zip = zip || 'nil'
      object = {
        :status => 422,
        :title => 'not a valid zip code',
        :detail => 'the value `' + zip + '` is not a zip code',
      }
      return [object]
    end

    zipEstimates = Zip.find_by zip: zip

    unless zipEstimates then
      object = {
        :status => 404,
        :title => 'zip code not found',
        :detail => 'the zip code`' + zip + '` is not in our records',
      }
      return [object]
    end

    zipEstimates = {
      :data => {
        :type => 'zip',
        :id => zipEstimates.zip,
        :attributes => {
          :msaName => zipEstimates.msaName,
          :cbsa => zipEstimates.cbsa,
          :p2014 => zipEstimates.p2014,
          :p2015 => zipEstimates.p2015,
        }
      },
    }

    return zipEstimates
  end
end
