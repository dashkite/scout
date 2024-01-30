import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import get from "./get"

isPath = ( value ) ->
  ( Type.isString value ) ||
    ( Type.isArray value )

isMethod = ( value ) -> 
  value?.request? || value?.response?

signature = generic name: "signature"

generic signature,
  isPath,
  Type.isObject,
  ( path, api ) -> get path, api

# curried form, since we have a unary variant
generic signature,
  isPath,
  ( path ) ->
    ( api ) -> get path, api

generic signature,
  Type.isString,
  isMethod,
  ( type, method ) -> method[ type ]

export default signature
export { signature }