import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import * as URLCodex from "@dashkite/url-codex"
import resources from "./resources"
import templates from "./templates"

isRequest = ( value ) ->
  ( Type.isObject value ) && value.target?

decode = generic name: "decode"

# TODO support matching against full URL
generic decode,
  isRequest,
  Type.isObject,
  ( request, api ) -> decode request.target, api

# curried form, since we have a unary variant
generic decode,
  Type.isDefined,
  ( value ) ->
    ( api ) -> decode value, api

generic decode,
  Type.isString,
  Type.isObject,
  ( target, api ) ->
    for resource in resources api
      for template in templates resource
        if ( bindings = URLCodex.match template, target )?
          return { name: resource.name, bindings }

export default decode
export { decode }
