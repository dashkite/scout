import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import resource from "./resource"

methods = generic name: "methods"

generic methods,
  Type.isString,
  Type.isObject,
  ( name, api ) ->
    methods resource name, api

# curried form, since we have a unary variant
generic methods,
  Type.isString,
  ( name ) ->
    ( api ) ->
      methods resource name, api

generic methods,
  Type.isObject,
  ( resource ) ->
    if resource?
      for name, method of resource.methods
        { name, method... }

export default methods
export { methods }