import * as Fn from "@dashkite/joy/function"
import get from "./get"

description = Fn.curry ( path, api ) ->
  ( get path, api )?.description

export default description