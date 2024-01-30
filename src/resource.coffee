resource = ( name, api ) ->
  _resource = api?.resources?[ name ]
  { name, _resource... }

export default resource
export { resource }