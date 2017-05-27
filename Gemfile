source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0'
gem 'sqlite3'
gem 'puma', '~> 3.7'

## For GraphQL
gem 'graphql'
gem 'graphql-api'

group :development, :test do
  gem 'byebug'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'annotate'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end
