# Common LeadConduit Integration Cakefile

A Node.JS utility module for building LeadConduit integrations.

[![Build Status](https://travis-ci.org/activeprospect/leadconduit-cakefile.svg?branch=master)](https://travis-ci.org/activeprospect/leadconduit-cakefile)


This module provides the standard build utilities for integration modules. To use it:

1. require in your module's `package.json`: `npm install leadconduit-cakefile --save-dev`
2. due to npm-install bootstrapping issues, your module must include `coffee-script` in `devDependencies` (other build-related modules, e.g., `mocha`, `coffeelint`, are provided here and not needed in `devDependencies`).
3. create a file called `Cakefile` in the root of the module, with this single line:

```coffeescript
require('leadconduit-cakefile')(task)
```


## Cake Tasks

The tasks provided for the `cake` command (run `cake` to see the list, as well):

- `build` - delete and rebuild the package's `lib` directory from all `.coffee` source files in `src`
- `lint` - run `coffeelint` on `.coffee` source files in `src`
- `test` - run the mocha unit tests defined in `*-spec.coffee` spec files in `spec`
    - Optionally, use `-p` or `--prefix` to specify a prefix for the test files to run. This can be a string which prefixes the files to target (e.g., "inbound" would match just `inbound*-spec.coffee`), or with a trailing slash, a directory name (e.g., "outbound/" would match all the `*-spec.coffee` files in `spec/outbound`).

If the module that includes this one needs to override one of the included tasks, it can do so by defining that task after the `require` listed above:

```
task 'test', ->
  console.log 'Tests? We ain\'t got no tests. We don\'t need no tests. I don\'t have to show you any stinking tests.'
```
