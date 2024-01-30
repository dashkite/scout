import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import get from "./get"

isPath = ( value ) ->
  ( Type.isString value ) ||
    ( Type.isArray value )

accept = generic name: "accept"

generic accept,
  isPath,
  Type.isObject,
  ( path, api ) ->
    accept get path, api

# curried form, since we have a unary variant
generic accept,
  isPath,
  ( path ) ->
    ( api ) -> 
      accept get path, api

generic accept,
  Type.isObject,
  ( method ) ->
    method?.response?[ "content-type" ]

export default accept
export { accept }