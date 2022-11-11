import * as Meta from "@dashkite/joy/metaclass"

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
