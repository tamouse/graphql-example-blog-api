require 'test_helper'

class GraphqlControllerTest < ActionDispatch::IntegrationTest
  test "responds to query" do
    post graphql_url, params: 'query=query { posts { id } }'
    assert_response :success
  end

  test "creates an Author" do
    assert(Author.all.empty?, Author.all.to_json)
    author_name = "Foo"
    params = "query=mutation {createAuthor(input: { name: #{author_name.inspect}}) { author { id }}}"
    post graphql_url, params: params
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal(['data'],json.keys)
    assert_equal(1, json['data']['createAuthor']['author']['id'])
    authors = Author.where(name: author_name)
    assert_equal(1, authors.count)
    assert_equal(author_name, authors.first.name)
  end

  test "retreives the authors" do
    Author.create([{name: "Foo"}, {name: "Bar"}])
    params = "query=query { authors { id name }}"
    post graphql_url, params: params
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal(['data'],json.keys)
    assert_equal(2, json['data']['authors'].length)
    names = json['data']['authors'].map{|author| author['name']}
    assert_equal(["Foo", "Bar"].sort, names.sort)
  end

  test "handles errors in queries" do
    params = "query=mutation {createPost(inputs: {title: \"hello world\"}) {post {id}}}"
    post graphql_url, params: params
    assert_response :unprocessable_entity
  end

  test "handles exceptions in queries" do
    params = "blah"
    post graphql_url, params: params
    assert_response :bad_request
  end
end
