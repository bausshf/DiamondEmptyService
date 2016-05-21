/**
* Module for the test controller.
*/
module controllers.testcontroller;

import vibe.d;

import diamond.controllers;

/// The controller for the test route.
final class TestController : Controller {
  public:
  final:
  /**
  * Creates a new instance of the test controller.
  * Params:
  *   request =     The request.
  *   response =    The response.
  *   route =       The route.
  */
  this(HTTPServerRequest request, HTTPServerResponse response, string[] route) {
    super(request, response, route);

    mapAction(HTTPMethod.GET, "JsonTest", &jsonTest);
    mapAction(HTTPMethod.GET, "JsonTest2", &jsonTest2);
  }

  private:
  /// Route: /Test/JsonTest
  Status jsonTest() {
    return jsonString(q{{
        "name": "Jacob",
        "age": 23,
        "gender": "male"
    }});
  }

  /// Route: /Test/JsonTest2
  Status jsonTest2() {
    import models;

    return json(new Test("Hello Diamond!", 42));
  }
}
