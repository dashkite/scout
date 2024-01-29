import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import resource from "./resource"

templates = generic name: "templates"

generic templates,
  Type.isString,
  Type.isObject,
  ( name, api ) ->
    templates resource name, api

# curried form, since we have a unary variant
generic templates,
  Type.isString,
  ( name ) ->
    ( api ) ->
      templates resource name, api

generic templates,
  Type.isObject,
  ( resource ) ->
    if resource?.templates?
      resource.templates
    else if resource?.template?
      [ resource.template ]
    else []

export default templates
export { templates }