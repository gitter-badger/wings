# Package

version       = "0.0.1"
author        = "BinHong Lee"
description   = "A simple cross language struct and enum file generator."
license       = "MIT"
skipDirs      = @["examples"]
bin           = @["wings"]
srcDir        = "src/main"
installExt    = @["nim"]

# Dependencies

requires "nim >= 0.17.2"

task genFile, "Generate file(s)":
    exec "nimble build"
    var start = false
    var temp: string = ""
    for i in countup(0, paramCount(), 1):
        if start:
            temp &= " " & paramStr(i)
        elif paramStr(i) == "genFile":
            start = true
    exec "./wings" & temp
