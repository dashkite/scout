# Technical Notes

### The Accessor Pattern and Space-Time Tradeoffs

Parsing or navigating large data structures manually is often error-prone, brittle, and unwieldy. Scout implements an accessor pattern to abstract the traversal logic away from the developer.

This approach represents a fundamental space-time tradeoff in computer science. By deferring the navigation into an abstract computation process, we exchange a small amount of runtime computation for savings in code space. It frees creators from encoding repetitive traversal logic across multiple modules, preventing brittleness and simplifying maintenance. This structural accessor pattern is a recurring architectural theme throughout DashKite codebases.

### The Sky API Concept

The foundation of Scout is the Sky API concept, formally described by a [JSON schema](../src/json-schema.yaml) that defines HTTP APIs. 

The Sky API approach is highly prescriptive. It stipulates that authors organize their APIs using distinct HTTP resources and group them under related names that can be expressed with a URL Codex template. This structural discipline enables the creation of abstract resource spaces, explicitly modeling an application's interface as constraint-based hypermedia.

These stipulations are deliberately more restrictive than specifications like OpenAPI, which tend to support arbitrary constructions and a bias for Remote Procedure Call (RPC) interfaces. By adopting the Sky API constraints, we unlock metaprogramming capabilities that offer major implications for interface stability, correctness, compactness, and security. The JSON schema encodes these HTTP-related aspects systematically, providing the groundwork to build interfaces and tooling for both clientside and serverside environments.

### Curried Operations

By default, all utility functions that take more than one argument are curried. This provides an elegant mechanism for developers to construct partially applied functions during functional composition workflows.

### Path Resolution

Functions that accept a path argument support a logical dot-delimited string format (e.g., `"user.post.response"`) or an array format (e.g., `[ "user", "post", "response" ]`). The library handles both forms transparently to maximize flexibility.

### Sky API Description Integration

The Sky API description specification is available directly as a subpath import using `json-schema`. This allows consumers to quickly access the schema validations without manually reading external documentation.
