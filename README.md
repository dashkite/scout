# Scout

*Convenience functions for working with Sky API descriptions*

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

Scout provides convenience utilities for navigating, discovering, and interacting with Sky API descriptions. It simplifies extracting metadata such as methods, signatures, and URL templates, supporting functional composition natively.

## Features

- Provides targeted extraction of API properties like resources, methods, and types
- Supports functional composition with curried utility functions
- Evaluates URL templates and encodes or decodes resource specifiers
- Retrieves nested API definitions using logical path traversal

## Installation

```bash
pnpm install @dashkite/scout
```

## Usage

You can use Scout to extract a specific resource and its primary URL template from a Sky API description.

```coffeescript
import { resource, template } from "@dashkite/scout"

# assume api is a loaded Sky API description
userResource = resource "user", api
endpoint = template userResource
```

## Other Resources

- [Reference Documentation](docs/reference.md)
- [Usage Guides](docs/recipes.md)
- [Technical Notes](docs/technical-notes.md)
- [Testing](docs/testing.md)
