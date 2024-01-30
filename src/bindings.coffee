import * as Fn from "@dashkite/joy/function"
import * as Parsers from "@dashkite/url-codex/parsers"
import template from "./template"

bindings = Fn.curry ( name, api ) ->
  _template = template name, api
  description = Parsers.template _template
  _bindings = []
  if description.origin?
    for node in description.origin.domain when node.expression?
      _bindings.push node.expression.variable
  if description.path?
    for node in description.path when node.expression?
      _bindings.push node.expression.variable
  if description.query?
    for node in description.path when node.value.expression?
      _bindings.push node.value.expression.variable
  _bindings

export default bindings
export { bindings }

