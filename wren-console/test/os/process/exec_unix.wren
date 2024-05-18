// platform: Unix
import "os" for Platform, Process
import "io" for Stdout

var TRY = Fn.new { |fn|
  var fiber = Fiber.new {
    fn.call()
  }
  return fiber.try()
}

var result
if(Platform.isPosix) {
  result = Process.exec("true")
  System.print(result) // expect: 0

  // basics

  // known output of success/fail based on only command name
  System.print(Process.exec("true")) // expect: 0
  System.print(Process.exec("false")) // expect: 1
  // these test that our arguments are being passed as it proves
  // they effect the result code returned
  System.print(Process.exec("test", ["2", "-eq", "2"])) // expect: 0
  System.print(Process.exec("test", ["2", "-eq", "3"])) // expect: 1

  // cwd

  // tests exists in our project folder
  Stdout.flush()
  System.print(Process.exec("ls", ["test/README.md"])) 
  // expect: test/README.md
  // expect: 0

  // but does not in our `src` folder
  // TODO: python needs a way to expect exactly stderr output
  // other than errors
  // System.print(Process.exec("ls", ["test"], "./src/")) 
  // noexpect: 1

  // env

  System.print(Process.exec("true",[],null,{})) // expect: 0
  var result = TRY.call { 
    Process.exec("ls",[],null,{"PATH": "/whereiscarmen/"}) 
  }
  System.print(result) 
  // TODO: should be on stderr
  // expect: Could not launch ls, reason: no such file or directory
  // TODO: should this be a runtime error?????
  // expect: Could not spawn process.
}