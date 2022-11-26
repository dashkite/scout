import * as Meta from "@dashkite/joy/metaclass"
import * as Sublime from "@dashkite/maeve/sublime"
import { MediaType, Accept } from "@dashkite/media-type"

class Method

  Meta.mixin @::, [

    Meta.properties
      authorization:
        get: -> @request.authorization 
        set: ( value ) -> @request.authorization = value

  ]

  @from: ({ name, request, response }) -> 
    Object.assign ( new @ ), { name, request, response }

  contentSupported: ( request ) ->
    if @request[ "content-type" ]?
      candidates = @request[ "content-type" ]
      target = Sublime.Request.Headers.get "content-type"
      if target?
        type = candidates.find ( candidate ) ->
          Accept.match candidate, target
        type?
      # no content-type header
      # TODO we should probably return false as this is a malformed request
      else true
    # no content-type specified in the API
    else true

  # TODO this repeats some of the logic from contentSupported
  contentFrom: ( request ) ->
    if @request[ "content-type" ]?
      candidates = @request[ "content-type" ]
      target = Sublime.Request.Headers.get "content-type"
      if target?
        type = candidates.find ( candidate ) -> Accept.match candidate, target
        if type? then category = MediaType.category type        
    category ?= MediaType.infer request.content
    switch category
      when "json"
        try
          JSON.parse request.content
      else request.content


export {
  Method
}
