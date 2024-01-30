import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import get from "./get"

isPath = ( value ) ->
  ( Type.isString value ) ||
    ( Type.isArray value )

isMethod = ( value ) -> value?.response?

statuses = generic name: "statuses"

generic statuses,
  isPath,
  Type.isObject,
  ( path, api ) -> 
    statuses get path, api

# curried form, since we have a unary variant
generic statuses,
  isPath,
  ( path ) ->
    ( api ) -> 
      statuses get path, api

generic statuses,
  isMethod,
  ( method ) ->
    method.response.status

export default statuses
export { statuses }