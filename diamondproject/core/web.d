module web;

import vibe.d;

import diamond.configurations.websettings;

class DiamondProjectSettings : WebSettings {
    public:
    this() {
        super();
    }

    override bool onBeforeRequest(HTTPServerRequest request, HTTPServerResponse response) {
        return true;
    }

    override void onAfterRequest(HTTPServerRequest request, HTTPServerResponse response) {
        // ...
    }

    override void onHttpError(HTTPServerRequest request, HTTPServerResponse response, HTTPServerErrorInfo error) {
        import diamondapp : serverSettings;

        foreach (headerKey,headerValue; serverSettings.defaultHeaders) {
            response.headers[headerKey] = headerValue;
        }

        response.statusCode = error.code;
        response.bodyWriter.write(error.exception.toString());
    }
}

shared static this() {
    WebSettings.initialize(new DiamondProjectSettings);
}
