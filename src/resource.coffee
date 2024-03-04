import * as Fn from "@dashkite/joy/function"

resource = Fn.curry ( name, api ) ->
  if api?.resources?
    { domain, origin, resources } = api
    { domain, origin, name, resources[ name ]... }
  else
    throw new Error "scout: invalid API definition"

export default resource
export { resource }