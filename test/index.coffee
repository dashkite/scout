import { test, success } from "@dashkite/amen"
import print from "@dashkite/amen-console"
import assert from "@dashkite/assert"

# MUT
import API from "../src"

api =
  resources:
    foo:
      description: "This is a test resource."
      templates: [ "/foo" ]
      methods:
        post:
          request:
            "content-type": [ "application/json" ]
            schema:
              type: "object"
            authorization: [ "rune" ]
          response:
            status: [ 200 ]
            "content-type": [ "application/json" ]

    bar:
      description: "This is another test resource."
      templates: [ "/{baz}/{buzz}" ]
      # we're currently only using this to test the bindings
      # combinator so it doesn't need any further detail

do ->

  print await test "Scout", [

    test "discover", [
      test "origin"
      test "domain"
      test "sublime"
    ]
    
    test "description", ->
      description = API.description "foo", api
      assert.equal description,
        "This is a test resource."

    test "resources", ->
      resources = API.resources api
      assert.equal resources.length, 2
      assert.equal "foo", resources[0]?.name

    test "resource", ->
      resource = API.resource "foo", api
      assert.equal "foo", resource?.name

    test "templates", ->
      templates = API.templates "foo", api
      assert.equal "/foo", templates[0]

    test "template", ->
      template = API.template "foo", api
      assert.equal "/foo", template

    test "get", [

      test "resource", ->
        resource = API.get "foo", api
        assert resource.methods?

      test "method"

      test "signature"

    ]

    test "methods", ->
      methods = API.methods "foo", api
      assert.equal 1, methods.length
      assert.equal "post", methods[0].name

    test "method", ->
      method = API.method "foo.post", api
      assert method.request?

    test "signature", ->
      signature = API.signature "foo.post.response", api
      assert.equal 200, signature.status[0]

    test "types", ->
      types = API.types "foo.post.response", api
      assert.equal "application/json", types[0]

    test "accept", ->
      accept = API.accept "foo.post", api
      assert.equal "application/json", accept[0]

    test "schema", ->
      schema = API.schema "foo.post.request", api
      assert.equal "object", schema.type

    test "statuses", ->
      statuses = API.statuses "foo.post", api
      assert.equal 200, statuses[0]

    test "bindings", [

      test "no bindings", ->
        bindings = API.bindings "foo", api
        assert.equal 0, bindings.length

      test "has bindings", ->
        bindings = API.bindings "bar", api
        assert.deepEqual [ "baz", "buzz" ], bindings

    ]  

    test "authorization", ->
      authorization = API.authorization "foo.post", api
      assert.deepEqual [ "rune" ], authorization

    test "encode", ->
      resource =
        name: "bar"
        bindings:
          baz: "abc"
          buzz: "def"
      assert.equal "/abc/def",
        API.encode resource, api
  
    test "decode", ->
      assert.deepEqual ( API.decode "/abc/def", api ),
        name: "bar"
        bindings:
          baz: "abc"
          buzz: "def"

    test "aggregates", [
      test "has aggregates"
      test "no aggregates"
    ]

  ]

  if success then process.exit 0 else process.exit 1