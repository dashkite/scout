import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import * as URLCodex from "@dashkite/url-codex"
import template from "./template"

isResource = ( value ) ->
  ( Type.isObject value ) && value.name?

isRequest = ( value ) ->
  ( Type.isObject value ) && ( isResource value.resource )

encode = generic name: "encode"

generic encode,
  isRequest,
  Type.isObject,
  ( request, api ) ->
    encode request.resource, api

# curried form, since we have a unary variant
generic encode,
  Type.isObject,
  ( value ) ->
    ( api ) -> encode value, api

generic encode,
  isResource,
  Type.isObject,
  ( resource, api ) ->
    # TODO possibly try each template?
    URLCodex.encode ( template resource.name, api ), 
      resource.bindings

export default encode
export { encode }