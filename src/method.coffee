import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import get from "./get"

isPath = ( value ) ->
  ( Type.isString value ) ||
    ( Type.isArray value )

isResource = ( value ) -> value?.methods?

method = generic name: "method"

generic method,
  isPath,
  Type.isObject,
  ( path, api ) -> get path, api

# curried form, since we have a unary variant
generic method,
  isPath,
  ( path ) ->
    ( api ) -> get path, api

generic method,
  Type.isString,
  isResource,
  ( name, resource ) -> 
    resource.methods[ name ]

export default method
export { method }