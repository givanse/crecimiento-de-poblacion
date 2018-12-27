require 'test_helper'

class ZipsControllerTest < ActionDispatch::IntegrationTest
  
  test "rejects invalid us zip codes" do
    get api_v1_zip_path('abcde')
    parsed_body = JSON.parse(response.body)
    assert_equal(response.status, 400)
    error = parsed_body['errors'][0]
    assert_equal(error['status'], 422)
    assert_equal(error['title'], 'not a valid zip code')
    assert_equal(error['detail'], 'the value `abcde` is not a zip code')
  end

end
