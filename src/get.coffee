import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"

get = generic name: "get"

isAPI = ( value ) -> value?.resources?

isResource = ( value ) -> value?.methods?

generic get,
  Type.isString,
  Type.isObject,
  ( path, api ) ->
    get ( path.split "." ), api

generic get,
  Type.isArray,
  isAPI,
  ([ resource, path... ], api ) ->
    get path, api.resources[ resource ]

generic get,
  Type.isArray,
  isResource,
  ( path, resource ) ->
    switch path.length
      when 0 then resource
      when 1
        [ method ] = path
        resource.methods[ method ]
      when 2
        [ method, signature ] = path
        resource.methods[ method ]?[ signature ]
      else
        throw new Error "sky-discovery:
          invalid accessor path [ #{ path } ]"

get = Fn.curry Fn.binary get

isPath = ( value ) ->
  ( Type.isString value ) ||
    ( Type.isArray value )

export default get
export { get, isPath }