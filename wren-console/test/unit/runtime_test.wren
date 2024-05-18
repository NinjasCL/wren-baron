// nontest
import "wren-testie/testie" for Testie, Expect
import "../../src/cli/path" for Path
import "runtime" for Runtime

Testie.test("Runtime") { |it, skip|
  it.should("have class level constants") {
    Expect.value(Runtime.NAME).toEqual("wren-console")
    Expect.value(Runtime.WREN_VERSION).toEqual("0.4.0")
    Expect.value(Runtime.VERSION).toBeDefined()
  }
  it.should("have details") {
    var details = Runtime.details
    Expect.value(details["name"]).toEqual("wren-console")
    Expect.value(details["wrenVersion"]).toEqual("0.4.0")
    Expect.value(details["version"]).toBeDefined()
  }
  it.should("assertVersion") {
    Runtime.assertVersion("0.1.0")
    Runtime.assertVersion("0.2.5")
    Runtime.assertVersion("0.3.0")
    Expect.that { Runtime.assertVersion("12.0.0") }
      .toAbortWith("wren-console version 12.0.0 or higher required.")
  }
  it.should("have capabilities") {
    var details = Runtime.details
    Expect.value(details.where { |x| x.name == "essentials"}).toBeDefined()
    Expect.value(details.where { |x| x.name == "json"}).toBeDefined()
  }
  it.should("allow querying capabilities") {
    Expect.value(Runtime.hasCapability("json")).toBe(true)
    Expect.value(Runtime.hasCapability("ensure")).toBe(true)
    // got milk?
    Expect.value(Runtime.hasCapability("milk")).toBe(false)
  }
}
