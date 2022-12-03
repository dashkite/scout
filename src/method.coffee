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

export {
  Method
}
