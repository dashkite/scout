# Reference Documentation

All functions with more than one argument are curried by default, supporting flexible functional composition.

## accept

$\text{accept}: path \to types$
$\text{accept}: method \to types$

Returns the list of possible accept media types for a request, given either a logical path (and an API description via currying) or a method. This serves as a convenience form of `types` for the response signature.

## aggregates

$\text{aggregates}: name \to resource\_name$
$\text{aggregates}: resource \to resource\_name$

Returns the name of the resource that the given resource aggregates, if any. 

## authorization

$\text{authorization}: path \to schemes$
$\text{authorization}: method \to schemes$

Returns the list of permissible authorization schemes for a method, given either a logical path or a method.

## decode

$\text{decode}: target \to specifier$

Given a URL target (path and query) and an API description (via currying), returns a resource specifier.

## description

$\text{description}: path \to text$

Given a logical path and an API description, returns the description property associated with the object.

## discover

$\text{discover}: origin \dashrightarrow api$
$\text{discover}: domain \dashrightarrow api$
$\text{discover}: resource \dashrightarrow api$

Make a discovery call based on an origin, domain, or resource to fetch the API description.

## encode

$\text{encode}: specifier \to target$

Given a resource specifier and an API description (via currying), returns a URL target (path and query).

## get

$\text{get}: path \to description$

Given a logical path and an API description, returns the specified object from within the description or `undefined` if it doesn't exist. The path is a dot-delimited list of *resource, method, signature*.

## method

$\text{method}: path \to method$
$\text{method}: name \to method$

Returns a method given either a path and an API description, or a name and a resource definition.

## methods

$\text{methods}: name \to method\_list$
$\text{methods}: resource \to method\_list$

Returns a list of methods given either a resource name and an API description, or an API resource description directly.

## resource

$\text{resource}: name \to resource$

Returns the resource with the given name from an API description.

## resources

$\text{resources}: api \to resource\_list$

Return a list of resources from an API description.

## schema

$\text{schema}: path \to schema$
$\text{schema}: signature \to schema$

Returns the schema associated with a signature, given either a path and an API description, or a signature directly.

## signature

$\text{signature}: path \to signature$
$\text{signature}: name \to signature$

Returns a method signature given either a path and an API description, or a name (request or response) and a method.

## statuses

$\text{statuses}: path \to statuses$
$\text{statuses}: method \to statuses$

Returns the list of possible statuses for a response, given either a path and an API description, or a method directly.

## template

$\text{template}: name \to url\_template$
$\text{template}: resource \to url\_template$

Returns the primary URL template associated with a resource.

## templates

$\text{templates}: name \to url\_template\_list$
$\text{templates}: resource \to url\_template\_list$

Returns the list of URL templates associated with a resource.

## traits

$\text{traits}: name \to traits$
$\text{traits}: resource \to traits$

Returns the list of traits (such as binding variables) for a given resource, which may be specified by name and API description.

## types

$\text{types}: path \to types$
$\text{types}: signature \to types$

Returns the content-types of a signature, given either a path and an API description, or a signature.
