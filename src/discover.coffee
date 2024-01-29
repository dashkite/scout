import { generic } from "@dashkite/joy/generic"
import * as Type from "@dashkite/joy/type"

isOrigin = ( value ) ->
  ( Type.isString value ) && value.startsWith "https://"

isDomain = Type.isString

isSkyRequest = ( value ) ->
  Sky?.fetch? && 
    ( Type.isObject value ) && 
    ( value.domain? && value.lamda? )

discover = generic name: "discover"

generic discover,
  isDomain,
  ( domain ) ->
    discover "https://#{ domain }"

generic discover,
  isOrigin,
  ( origin ) ->
    response = await fetch origin,
      method: "get"
      headers: accept: [ "application/json" ]
    if 200 <= response.status < 300
      response.json()

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
      @from response.content

export default discover
export { get }