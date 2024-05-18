import "runtime" for Runtime
import "os" for Process
import "json" for JSON

var args = Process.allArguments
var env = JSON.parse(args[2])
var name = env["get"]["name"]

System.print("<h1>Hello From Wren %(Runtime.WREN_VERSION)</h1>")
System.print("<h2>This is rendered from <strong>Wren</strong></h2>")
System.print("<p>Hello <strong>%(name)</strong></p>")
