Rails.application.routes.draw do
  post 'graphql' => 'graphql#query'
end
