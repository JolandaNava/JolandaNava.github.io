## Develop

To work with the project:

- run `elm-app start`
- run `npm run watch-css`

app will be served on http://localhost:3000/

## Deploy

To deploy the application to Github pages:

- run `make deploy m="commit message"`

This command:
- builds the elm app
- copies the contents over to the `docs` folder (where Github pages expects them)
- stages all changes and pushes a commit to main using the message provided in the prompt


To save changes but not deploy them to pages, simply commit without running the deploy command.