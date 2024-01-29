import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"

_get = ( root, property ) -> root?[ property ]

get = generic name: "get"

generic get,
  Type.isString,
  Type.isObject,
  ( path, api ) ->
    get ( path.split "." ), api

generic get,
  Type.isArray,
  Type.isObject,
  ( path, api ) -> path.reduce _get, api

get = Fn.curry Fn.binary get

export default get
export { get }