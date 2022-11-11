import { test, success } from "@dashkite/amen"
import print from "@dashkite/amen-console"
import assert from "@dashkite/assert"

# MUT
import { Description } from "../src"

description = Description.from
  resources:
    foo:
      template: "/foo"
      methods:
        post:
          signatures:
            request: {}
            response:
              status: [ 200 ]

do ->

  print await test "Sky API Description", [

    test "decode", ->
      { name, bindings } = description.decode target: "/foo"
      assert.equal "foo", name
      assert.deepEqual {}, bindings

    test "methods", ->
      { request, response } = description.resources.foo.methods.post
      assert request?
      assert response?

    test "resource iterator", ->
      for resource from description
        assert resource.name?

    test "method iterator", ->
      for method from description.resources.foo
        assert method.name?
        
    test "method assignment", ->
      method = description.resources.foo.methods.post
      method.authorization = [ "rune" ]
      assert description.data.resources.foo.methods.post.signatures.request.authorization?
  ]

  process.exit success