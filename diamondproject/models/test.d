/**
* Module for the test model.
*/
module models.test;

/// Test model.
class Test {
  public:
  /// foo.
  string foo;
  /// bar.
  int bar;

  /**
  * Creates a new instance of the test model.
  * Params:
  *   foo = Foo.
  *   bar = Bar.
  */
  this(string foo, int bar) {
    this.foo = foo;
    this.bar = bar;
  }
}
