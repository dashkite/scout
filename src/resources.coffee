resources = ( api ) ->
  if api?.resources?
    for name, resource of api.resources
      { name, resource... }

export default resources
export { resources }