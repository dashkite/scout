import * as Fn from "@dashkite/joy/function"

resource = Fn.curry ( name, api ) ->
  _resource = api?.resources?[ name ]
  { name, _resource... }

export default resource
export { resource }