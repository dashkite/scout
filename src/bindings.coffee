import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import * as Parsers from "@dashkite/url-codex/parsers"
import template from "./template"

_bindings = ( _template ) ->
  description = Parsers.template _template
  result = []
  if description.origin?
    for node in description.origin.domain when node.expression?
      result.push node.expression.variable
  if description.path?
    for node in description.path when node.expression?
      result.push node.expression.variable
  if description.query?
    for node in description.query when node.value.expression?
      result.push node.value.expression.variable
  result

bindings = generic name: "bindings"

generic bindings,
  Type.isString,
  Type.isObject
  ( name, api ) ->
    _bindings template name, api

# explicit curry
generic bindings,
  Type.isString,
  ( name ) ->
    ( api ) ->
      _bindings template name, api

generic bindings,
  Type.isObject,
  ( resource ) ->
    _bindings template resource

export default bindings
export { bindings }

