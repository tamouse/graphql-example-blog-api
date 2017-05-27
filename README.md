# blog-api

An example using GraphQL with Rails.


## Installation

1. Fork a copy of this repo on Github.
2. Clone your fork to you local machine.

        git clone git@github.com:YOURGITHUBUSR/graphql-example-blog-api
        cd graphql-example-blog-api
        bundle install
        bin/rails server -b 0.0.0.0 -p 3000

## Usage

### Retrieve all post IDs:

    curl -XPOST -d 'query=query { post { id }}' http://localhost:3000/graphql

### Retrieve posts with ID and title, author and author ID:

    curl -XPOST -d 'query=query { post { id title author {id name} }}' http://localhost:3000/graphql

### Create an Author:

    curl -XPOST -d 'query=mutation { createAuthor(input: {name: "Foo Bar"}) { author { id } } }' http://localhost:3000/graphql

### List Authors:

    curl -XPOST _d 'query=query { authors { id name}}' http://localhost:3000/graphql

### Create a Post:

    curl -XPOST -d 'query=mutation { createPost(input: {title: "foobar", content: "foo bar baz quux", author_id: 1}) { post { id }}}' http://localhost:3000/graphql
