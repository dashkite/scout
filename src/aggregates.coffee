import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import resource from "./resource"

aggregates = generic name: "aggregates"

generic aggregates,
  Type.isString,
  Type.isObject,
  ( name, api ) ->
    aggregates resource name, api

# curried form, since we have a unary variant
generic aggregates,
  Type.isString,
  ( name ) ->
    ( api ) ->
      aggregates resource name, api

generic aggregates,
  Type.isObject,
  ( resource ) ->
    resource?.aggregates

export default aggregates
export { aggregates }