resources = ( api ) ->
  if api?.resources?
    { resources, domain, origin } = api
    for name, resource of resources
      { domain, origin, name, resource... }
  else
    throw new Error "scout: invalid API definition"

export default resources
export { resources }