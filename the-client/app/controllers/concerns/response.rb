module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

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
end

