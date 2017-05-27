require 'test_helper'

class GraphQlControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get graph_ql_create_url
    assert_response :success
  end

end
