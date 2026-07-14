# Usage Guides

## Discovering an API Description

Before creators can analyze an API, they must locate its description document. Scout simplifies this process by providing a discovery mechanism that resolves an origin or domain into a structured API description.

```coffeescript
import { discover } from "@dashkite/scout"

# retrieve the description from a known origin
api = await discover "https://api.example.com"
```

1. Import the discovery function from the library.
2. Supply the origin or domain of the target service.
3. Await the function to retrieve the fully resolved API description.

## Navigating API Descriptions

Developers often need to extract deeply nested property values from an API description. Scout enables this task by providing utility functions that handle structural lookups, avoiding complex and repetitive property checks across the codebase.

```coffeescript
import { get, description } from "@dashkite/scout"

# assume api contains a loaded description
postResponse = get "user.post.response", api
docString = description "user", api
```

1. Import the necessary lookup utilities from the library.
2. Supply a logical dot-delimited path indicating the structure, such as `resource.method.signature` for a response, or simply the resource name for its documentation.
3. Provide the API description to extract the associated property.

## Evaluating Request Signatures

When preparing an HTTP request, creators must ensure the payload matches the expected schema and that the client provides appropriate authorization. Scout streamlines this validation by extracting specific signature constraints directly from the logical path.

```coffeescript
import { schema, authorization, accept } from "@dashkite/scout"

# assume api contains a loaded description
payloadSchema = schema "user.post.request", api
authSchemes = authorization "user.post", api
mediaTypes = accept "user.post", api

# implementation of payload validation goes here
# validate payload against payloadSchema
```

1. Import the signature extraction functions.
2. Pass the logical path of the target method or signature along with the API description.
3. Inspect the returned schema, acceptable media types, and authorization requirements before dispatching the network request.

## Encoding Resource Specifiers

When building requests, creators must translate logical resource representations into literal URL targets. Scout accomplishes this natively by resolving API templates against binding variables.

```coffeescript
import { encode } from "@dashkite/scout"

specifier = 
  name: "person"
  bindings:
    id: "123"

# assume api contains a loaded description
target = encode specifier, api
```

1. Construct a resource specifier object detailing the target resource name and its template bindings.
2. Call the encoder function with the specifier and the overall API description.
3. Use the returned URL target path to perform network requests.

## Decoding URL Targets

Serverside frameworks must translate incoming URL targets back into logical resource specifiers to route requests accurately. Scout provides a decoding mechanism that reverses the encoding process, identifying the matched resource and extracting its traits.

```coffeescript
import { decode, traits } from "@dashkite/scout"

# assume api contains a loaded description
# assume targetPath represents an incoming request path
targetPath = "/person/123"

specifier = decode targetPath, api
resourceTraits = traits specifier.name, api
```

1. Provide the literal URL target path and the API description to the decoder function.
2. Receive the corresponding resource specifier, which includes the matched resource name and any populated binding variables.
3. Optionally query the traits of the identified resource to retrieve abstract structural metadata.
