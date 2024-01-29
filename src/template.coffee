import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import templates from "./templates"

first = ( value ) -> value?[ 0 ]

template = generic name: "template"

generic template,
  Type.isString,
  Type.isObject,
  ( name, api ) ->
    first templates name, api

# curried form, since we have a unary variant
generic template,
  Type.isString,
  ( name ) ->
    ( api ) ->
      first templates name, api

generic templates,
  Type.isObject,
  ( resource ) ->
    first templates resource

export default template
export { template }