export function debounce(func: Function) {
    let token: number | null;

    return function (this: HTMLElement) {
        const later = () => {
            token = null;
            func.apply(this, arguments);
        };
        if (token) {
            cancelIdleCallback(token);
            token = requestIdleCallback(later);
        }
    }
};

export function debounceTime(func: Function, timeout = 300) {
    let timer: ReturnType<typeof setTimeout>;
    return function (this: HTMLElement) {
        clearTimeout(timer);

        timer = setTimeout(() => {
            func.apply(this, arguments);
        }, timeout);
    }
}

export function trigger(this: HTMLElement, name: string, detail: any) {
    const event = new CustomEvent(name, {
        detail,
        bubbles: true,
        cancelable: false
    });
    this.dispatchEvent(event);
}
