import * as Meta from "@dashkite/joy/metaclass"
import * as Type from "@dashkite/joy/type"

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
            ( Reflect.get target, name, self ).signatures

  ]

  @from: ({ name, resource }) ->
    Object.assign ( new @ ), { name, resource }


export {
  Resource
}
