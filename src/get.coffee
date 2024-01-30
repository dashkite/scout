import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"

get = generic name: "get"

generic get,
  Type.isString,
  Type.isObject,
  ( path, api ) ->
    get ( path.split "." ), api

generic get,
  Type.isArray,
  Type.isObject,
  ( path, api ) ->
    switch path.length
      when 1
        [ resource ] = path
        api.resources?[ resource ]
      when 2
        [ resource, method ] = path
        api.resources?[ resource ]?.methods[ method ]
      when 3
        [ resource, method, signature ] = path
        api.resources?[ resource ]?.methods[ method ]?[ signature ]
      else
        throw new Error "sky-discovery:
          invalid accessor path [ #{ path } ]"

get = Fn.curry Fn.binary get

isPath = ( value ) ->
  ( Type.isString value ) ||
    ( Type.isArray value )

export default get
export { get, isPath }