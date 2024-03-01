import * as Fn from "@dashkite/joy/function"

# TODO make this a proper generic with some error handling DAN!
resource = Fn.curry ( name, api ) ->
  _resource = api?.resources?[ name ]
  { name, _resource... }

export default resource
export { resource }