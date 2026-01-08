import './css/main.scss';
import { Elm } from './Main.elm';
import { init, startElm } from './app-util.ts';

// add ports here as needed

const ENV = {
};


const sharedState = {};

function getElmFlags(env) {
  return new Promise((resolve) =>
    document.addEventListener('DOMContentLoaded', (event) => {
      
      const language = navigator.language;

      resolve({
        ...env,
        elmFlags: {
          language,
        },
      });
    })
  );
}

init(ENV)
  .then(getElmFlags)
  .then(startElm(Elm.Main, 'root', (env) => env.elmFlags))
  .then((app) => {
    app
  });
