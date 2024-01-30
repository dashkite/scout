import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import get from "./get"

isPath = ( value ) ->
  ( Type.isString value ) ||
    ( Type.isArray value )

types = generic name: "types"

generic types,
  isPath,
  Type.isObject,
  ( path, api ) ->
    types get path, api

# curried form, since we have a unary variant
generic types,
  isPath,
  ( path ) ->
    ( api ) -> 
      types get path, api

generic types,
  Type.isObject,
  ( signature ) ->
    signature[ "content-type" ]

export default types
export { types }