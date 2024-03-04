import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"

isOrigin = ( value ) ->
  ( Type.isString value ) && value.startsWith "https://"

isDomain = Type.isString

isSkyRequest = ( value ) ->
  Sky?.fetch? && 
    ( Type.isObject value ) && 
    ( value.domain? && value.lambda? )

getOrigin = ( domain ) -> "https://#{ domain }"

getDomain = ( origin ) -> ( new URL origin ).host

discover = generic name: "discover"

generic discover,
  isDomain,
  ( domain ) ->
    discover getOrigin domain 

generic discover,
  isOrigin,
  ( origin ) ->
    response = await fetch origin,
      method: "get"
      headers: accept: [ "application/json" ]
    if 200 <= response.status < 300
      api = await response.json()
      domain = getDomain origin
      { api..., origin, domain }

generic discover,
  isSkyRequest,
  ({ domain, lambda }) ->
    response = await Sky.fetch {
      domain, lambda
      resource: { name: "description" }
      method: "get"
      headers: accept: [ "application/json" ]
    }
    if response.description == "ok"
      api = JSON.parse response.content
      origin = getOrigin domain
      { api..., origin, domain }

export default discover
export { discover }