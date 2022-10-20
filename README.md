# Sky API Description

_Convenience wrapper for Sky API Descriptions_

```coffeescript
import { Description } from "@dashkite/sky-api-description"

# implict discovery
description = await Description.from { request }

# URL target decoding based on description templates
{ name, bindings } = description.decode request

# simplified and normalized accessors
contentType = description
	.resources
  .blogs
  .methods
  .post
  .response["content-type"]
```

## Features

- Explicit and implicit discovery
- Supports Sublime Request format
- Normalized and simplified description accessors