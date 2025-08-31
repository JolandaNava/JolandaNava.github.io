Using [Elm programming language](https://elm-lang.org/) and [Webpack](https://webpack.js.org/) as a build tool.

## Setup

- [Elm](https://elm-lang.org/) 0.19.1
- [nodejs](https://nodejs.org/) 22.17.0
- [elm-format](https://github.com/avh4/elm-format) 0.8.6

It doesn't matter how you decide to install these dependencies as long
as these binaries will be available in `$PATH`.
In particular, you can use [`nvm`](https://github.com/nvm-sh/nvm) or [`asdf`](https://github.com/asdf-vm/asdf) for management of nodejs versions for management of all the system dependencies.

Install nodejs dependencies via [npm](https://www.npmjs.com/):

```
$ npm install
```

## Developing

We use [npm scripts](https://docs.npmjs.com/misc/scripts) for predefined tasks.


To run development webserver (with watcher and auto recompilation):

```
$ npm start
```

app will be served on http://localhost:3000/


Run development webserver with elm debugger attached (might cause memory leaks):

```
$ npm run start -- --env elm-debugger=true
```

## Building the project

```
$ npm run build
```

## Deploy
To deploy the application to Github pages run

```
make deploy m="commit message"
```

This command:

- builds the elm app
- copies the contents over to the docs folder (where Github pages expects them)
- stages all changes and pushes a commit to main using the message provided in the prompt
- To save changes but not deploy them to pages, simply commit without running the deploy command.