import * as Fn from "@dashkite/joy/function"
import * as Type from "@dashkite/joy/type"
import { generic } from "@dashkite/joy/generic"
import method from "./method"
import { isPath } from "./get"

isMethod = ( value ) -> value?.request? || value?.response?
isMethodString = ( value ) -> 
  value in [ "get", "put", "patch", "delete", "post", "options", "head" ]

isResource = ( value ) -> value?.methods?

authorization = generic name: "authorization"

generic authorization,
  isPath,
  Type.isObject,
  ( path, api ) ->
    authorization method path, api

generic authorization,
  Type.isNullish,
  -> undefined

generic authorization,
  isMethod,
  ( method ) ->
    method?.request?.authorization

generic authorization,
  isMethodString,
  isResource,
  ( method, resource ) ->
    resource.methods[ method ]?.request?.authorization

export default authorization
export { authorization }