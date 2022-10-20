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
        
  ]

  process.exit success