import discover from "./discover"
import get from "./get"
import description from "./description"
import decode from "./decode"
import encode from "./encode"
import resources from "./resources"
import resource from "./resource"
import templates from "./templates"
import template from "./template"
import methods from "./methods"
import method from "./method"
import statuses from "./statuses"
import signature from "./signature"
import schema from "./schema"
import types from "./types"
import accept from "./accept"
import bindings from "./bindings"
import authorization from "./authorization"
import aggregates from "./aggregates"

API = {
  discover
  get
  description
  decode
  encode
  resources
  resource
  templates
  template
  methods
  method
  statuses
  signature
  schema
  types
  accept
  bindings
  authorization
  aggregates
}

# TODO phase this out?
export {
  discover
  get
  description
  decode
  encode
  resources
  resource
  templates
  template
  methods
  method
  statuses
  signature
  schema
  types
  accept
  bindings
  authorization
  aggregates
}

export default API