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
          response:
            status: [ 200 ]
            "content-type": [ "application/json" ]

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
      assert.equal resources.length, 1
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


  ]

  if success then process.exit 0 else process.exit 1