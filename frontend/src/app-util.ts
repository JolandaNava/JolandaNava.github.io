interface Env {
    [Key: string]: any;
}

interface Flags {
    [Key: string]: any;
}

interface GetFlags {
    (env: Env): Flags;
}

interface PortFc {
    (env: Env, ports: any): void;
}

interface ElmApp {
    ports: any,
}

interface ElmAppInit {
    flags: Flags;
    node: HTMLElement;
    env: Env;
}

interface ElmAppFactory {
    init(conf: ElmAppInit): ElmApp
}

interface PortDelegator {
    port(fc: PortFc): PortDelegator;
    app: ElmApp;
}

interface AppInitializer {
    (env: Env): PortDelegator;
}

// Promise based initialization logic for elm app
// Using promise allows to make app initialization async if necessary
// in situations where it's for instance necessary to do fetch some data
// over network before starting the app.
// Init functions are functions that take Env object and return promise that
// will be resolved with modified Env
export const init = (env: Env): Promise<Env> => {
    return new Promise(function (resolve) {
        resolve(env);
    });
}

// Abstration for wrapping app to PortDelegator interface
// PortDelegator interface is object containing app getter
// and factory function that applies PortFc and returns new PortDelegator.
// PortFc is void fuction that takes Env and ports object from app and performs effect (subscribing to a port).
export const Port = (env: Env, app: ElmApp): PortDelegator => {
    return {
        port: (portFc: PortFc) => {
            portFc(env, app.ports);
            return Port(env, app);
        },
        app: app,
    }
}

// This function will turn initialization promise into app
export const startElm = (entry: ElmAppFactory, elementId: string, getFlags: GetFlags): AppInitializer => {
    return (ENV: Env) => {
        const node = document.getElementById(elementId);
        if (!node) {
            throw new Error(`Element with id "${elementId}" not found`);
        }
        const app = entry.init({
            flags: getFlags(ENV),
            node,
            env: ENV,
        });

        return Port(ENV, app);
    }
}
