# NeuroBlu/PI Front-End

User interface for NeuroBlu / Project PI also known as RWE.
Front-end allows user to use all system capabilities
and at the moment is the only user facing component of the system.

We use [Elm programming language](https://elm-lang.org/) and [Webpack](https://webpack.js.org/) as a build tool.

## Setup

### Without Nix

There are several system requirements that need to be installed
on a system to make it ready for building the front-end part of the project.
Note that all of these are build requirements.
The project is built into static HTML, JavaScript and CSS which
just need to be served to the browser so there are no runtime dependencies
other than browser.

- [Elm](https://elm-lang.org/) 0.19.1
- [nodejs](https://nodejs.org/) 22.17.0
- [elm-format](https://github.com/avh4/elm-format) 0.8.6

It doesn't matter how you decide to install these dependencies as long
as these binaries will be available in `$PATH`.
In particular, you can use [`nvm`](https://github.com/nvm-sh/nvm) or [`asdf`](https://github.com/asdf-vm/asdf)
for management of nodejs versions.
for management of all the system dependencies.

Install nodejs dependencies via [npm](https://www.npmjs.com/):

```
$ npm install
```

### With Nix

Enable the experimental [Flakes](https://nixos.wiki/wiki/Flakes) feature and run `nix develop .#frontend`.
This opens a shell where every dependency is set up.

Alternatively, commands can be run as e.g. `nix develop .#frontend -c npm start`.

## Developing

We use [npm scripts](https://docs.npmjs.com/misc/scripts) for predefined tasks.

> ### TL;DR
>
> * Front-end **without backend** and with elm debugger: `npm run start -- --env elm-debugger=true staging-api=true`
> * Front-end against local backend: `npm start`
>

To run development webserver (with watcher and auto recompilation):

```
$ npm start
```

Run development webserver with elm debugger attached (might cause memory leaks):

```
$ npm run start -- --env elm-debugger=true
```

Run tests

```
$ npm test
```

Our build uses command line arguments in order to add more
[referential transparency](https://en.wikipedia.org/wiki/Referential_transparency) to the build.

Flags to the build are passed as following:

```
$ npm run [name-of-task] -- --env [flags]
```

Available flags are:

- `--env production=true` enable production environment including build optimisations.
- `--env elm-debugger=true` enable elm debugger. This is never enabled in production build.
- `--env staging-api=true` proxy to staging API instead of localhost (default).
- `--open` open browser once server starts.


## Building the project

There is `build` npm script which ensures that **mode is always set to production**.

```
$ npm run build
```

## Linting the elm code using elm review

```
npx elm-review
```
The configuration for elm-review is kept in the [review](./review) folder.

## Structure

Along with the main app code located within `src` directory we also have
bunch of separate modules in `lib/[name]` directories.
These lib modules are library candidates which might be later published
as stand-alone packages.

The architecture is still very much fluid so in case you have more specific questions
reach out to [@github.com/jolandanava](https://github.com/jolandanava) or [@turboMaCk (Marek)](https://github.com/turboMaCk),
we're happy to help.

## Additional Tips

Few additional tips that might improve experience when working with the code base:

- use [editorconfig](https://editorconfig.org/) to configure correct behaviour of your editor.
- use `npm run format` to reformat the code base with elm-format
- within `../backend` run `make elm` to generate Elm types for APi via [elm-street](https://github.com/holmusk/elm-street).
- use [nvm](https://github.com/nvm-sh/nvm), [asdf](https://asdf-vm.com) or [Nix](../nix/README.md) to manage versions nodejs.
- use [`./bin/unused.sh`](bin/unused.sh) script to see which declarations can be removed from code. This requires ([`elm-xref`](https://github.com/zwilias/elm-xref) to be installed)
