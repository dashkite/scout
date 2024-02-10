# Scout

_Convenience functions for working with Sky API descriptions_

## API

- All functions with more than one argument may be curried.
- Path arguments refer to a logical path relative to the API description. The path may be specified as a string or an array. Example: `“person.put”` or `[ "person", "get", "response" ]`.

- The Sky API description is available as a subpath import with the subpath `json-schema`.

### accept

*accept path, api  → types*
*accept method  → types*

Returns the list of possible accept media types for a request, given either a path and an API description or a method. Effectively a convenience form of `types` for the response signature.

### authorization

*authorization path, api → schemes*
*authorization method → schemes*

Returns the list of permissable authorization schemes for a method, given either a path and an API description or a method.

### aggregates

*aggregates name, api → resource-name*
*aggregates resource → resource-name*

Returns the resource that the given resource aggregates, if any.


### bindings

*bindings name, api → bindings*
*bindings resource → bindings*

Returns the list of binding variables for a given resource, which may be specified by name and API description.

Given a template, you may obtain the bindings by wrapping it in an object with a `template` property:

```coffeescript
for binding in bindings { template }
  console.log binding
```

### decode

*decode request, api → specifier*
*decode target, api → specifier*

Given a Sublime request or a URL target (path and query) and an API description, returns a resource specifier.


### description

*description path, api → description*

Given a logical path and an API description, returns the description property associated with the object.

### discover

*discover origin ⇢ api*
*discover domain ⇢ api*
*discover resource ⇢ api*

Make a discovery call based on an origin, domain, or resource.

### encode

*encode request, api → target*
*encode specifier, api → target*

Given a Sublime request (containing a Sublime resource specifier) or a Sublime resource specifier and an API description, returns a URL target (path and query).

### get

*get path, api → description*

Given a logical path and an API description, returns the specified object from within the description or `undefined` if it doesn’t exist. The path is a dot-delimited list of _resource, method, signature_. The signature component is optional and the method component is optional if the signature is not specified.

### method

*method path, api  → method*
*method name, resource → method*

Returns a method given either a path and an API description or a name and a resource definition.

### methods

*methods name, api → method-list*
*methods resource → method-list*

Returns a list of methods given either a resource name and an API description or an API resource description.

### resource

*resource name, api → resource*

Returns the resource with the given name from an API description.

### resources

*resources api → resource-list*

Return a list of resources from an API description.

### schema

*schema path, api  → schema*
*schema signature  → schema*

Returns the schema associated with a signature, given either a path and an API description or a signature.

### signature

*signature path, api  → signature*
*signature name, method  → signature*

Returns a method signature given either a path and an API description or a name (request or response) and a method.

### statuses

*statuses path, api  → statuses*
*statuses method  → statuses*

Returns the list of possible statuses for a response, given either a path and an API description or a method.

### template

*template name, api → url-template*
*template resource → url-template*

Returns the primary URL template associated with a resource.

### templates

*template name, api → url-template*
*template resource → url-template*

Returns the list of URL templates associated with a resource.

### types

*types path, api  → types*
*types signature  → types*

Returns the content-types of a signature, given either a path and an API description or a signature.
