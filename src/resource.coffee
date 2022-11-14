import * as Meta from "@dashkite/joy/metaclass"
import * as Type from "@dashkite/joy/type"
import * as Text from "@dashkite/joy/text"
import { Method } from "./method"

class Resource

  Meta.mixin @::, [

    Meta.getters

      templates: ->

        { template, templates } = @resource
        if template?
          if Type.isArray template then template else [ template ]
        else templates

      methods: ->
        new Proxy @resource.methods,
          get: ( target, name, self ) ->
            if ( method = Reflect.get target, name, self )?
              Method.from { name, method... }

      entries: ->
        Object.values @methods

      options: ->
        Text.join ",", @entries

  ]

  [ Symbol.iterator ]: -> @entries[ Symbol.iterator ]()

  @from: ({ name, resource }) ->
    Object.assign ( new @ ), { name, resource }


export {
  Resource
}
