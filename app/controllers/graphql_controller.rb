class GraphqlController < ApplicationController
  SCHEMA = GraphQL::Api::Schema.new.schema

  def query
    render json: SCHEMA.execute(
      params[:query],
      variables: params[:variables] || {},
      )
  end
end
