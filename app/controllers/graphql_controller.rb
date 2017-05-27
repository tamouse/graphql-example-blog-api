class GraphqlController < ApplicationController
  SCHEMA = GraphQL::Api::Schema.new.schema

  rescue_from StandardError, with: :woops

  def query
    results = SCHEMA.execute(
      params[:query],
      variables: params[:variables] || {},
      )
    if results.has_key?('data')
      render json: results
    else
      render json: results, status: :unprocessable_entity
    end
  end

  def woops(e)
    error = {errors: { message: "#{e.class}: #{e}" }}
    if e.kind_of?(ActiveRecord::RecordNotFound)
      render json: error, status: :not_found
    else
      render json: error, status: :bad_request
    end
  end
end
