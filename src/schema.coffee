import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import get from "./get"

isPath = ( value ) ->
  ( Type.isString value ) ||
    ( Type.isArray value )

isResource = ( value ) -> value?.methods?

schema = generic name: "schema"

generic schema,
  isPath,
  Type.isObject,
  ( path, api ) ->
    schema get path, api

generic schema,
  isPath,
  isResource,
  ( path, resource ) ->
    schema get path, resource

# curried form, since we have a unary variant
generic schema,
  isPath,
  ( path ) ->
    ( api ) -> 
      schema get path, api

generic schema,
  Type.isObject,
  ( signature ) -> signature.schema

export default schema
export { schema }