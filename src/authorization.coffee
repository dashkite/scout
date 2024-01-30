import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import method from "./method"
import { isPath } from "./get"

isMethod = ( value ) -> value?.request?

authorization = generic name: "authorization"

generic authorization,
  isPath,
  Type.isObject,
  ( path, api ) ->
    authorization method path, api

generic authorization,
  isMethod,
  ( method ) ->
    method.request.authorization

export default authorization
export { authorization }