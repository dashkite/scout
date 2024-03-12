import * as Fn from "@dashkite/joy/function"
import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"
import * as Parsers from "@dashkite/url-codex/parsers"
import template from "./template"

normalize = ({ variable: name, modifier }) ->
  switch modifier
    when "?"
      { name, type: "string", required: false }
    when "*"
      { name, type: "array", required: false }
    when "+"
      { name, type: "array", required: true }
    else
      { name, type: "string", required: true }

_traits = ( _template ) ->
  description = Parsers.template _template
  result = []
  if description.origin?
    for node in description.origin.domain when node.expression?
      result.push normalize node.expression
  if description.path?
    for node in description.path when node.expression?
      result.push normalize node.expression
  if description.query?
    for node in description.query when node.value.expression?
      result.push normalize node.value.expression
  result

traits = generic name: "traits"

generic traits,
  Type.isString,
  Type.isObject
  ( name, api ) ->
    _traits template name, api

# explicit curry
generic traits,
  Type.isString,
  ( name ) ->
    ( api ) ->
      _traits template name, api

generic traits,
  Type.isObject,
  ( resource ) ->
    _traits template resource

export default traits
export { traits }

