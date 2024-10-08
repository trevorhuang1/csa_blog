export var uri;
if (location.hostname === "localhost") {
        uri = "http://127.0.0.1:4100";
} else if (location.hostname === "127.0.0.1") {
        uri = "http://127.0.0.1:4100";
} else {
        uri = "https://trevorhuang1.github.io/csa_blog/";
}

export const options = {
    method: 'GET', // *GET, POST, PUT, DELETE, etc.
    mode: 'cors', // no-cors, *cors, same-origin
    cache: 'default', // *default, no-cache, reload, force-cache, only-if-cached
    credentials: 'include', // include, same-origin, omit
    headers: {
        'Content-Type': 'application/json',
    },
};