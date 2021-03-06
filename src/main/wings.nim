from times import epochTime
from os
import createDir, fileExists, paramCount, paramStr,
  parentDir, setCurrentDir
from strutils import endsWith, removePrefix, startsWith
import stones/genlib
import stones/log
import sets
import tables
import wingspkg/core
import wingspkg/util/config

const CONFIG_PREFIX: string = "-c:"
const HELP_OPTION: string = "-h"
var USER_CONFIG: Config = initConfig()

proc toFile(path: string, content: string): void =
  try:
    for outputDir in USER_CONFIG.outputRootDirs.items:
      if outputDir.len() > 0:
        setCurrentDir(outputDir)
      else:
        setCurrentDir(CALLER_DIR)
      createDir(parentDir(path))
      writeFile(path, content)
      LOG(SUCCESS, "Successfully generated " & outputDir & "/" & path)
  except:
    LOG(ERROR, "Failed to generate " & path)

proc init(count: int): void =
  let startTime = epochTime()
  if count < 1:
    LOG(FATAL, "Please add wings files to be generated. Or use `-h` for help.")
    return

  var configFile: string = ""
  var wingsFiles: seq[string] = newSeq[string](0)
  for i in countup(1, count, 1):
    let file = paramStr(i)
    if file.startsWith(HELP_OPTION):
      echo ""
      echo "-c:{CONFIG_FILE}.json\t - The config file should be a json file."
      echo "-h\t\t\t - Show this menu."
      echo ""
      echo "Expects {FILENAME}.wings files to be generated from."
      echo ""
      return
    elif file.startsWith(CONFIG_PREFIX):
      if configFile.len() > 0:
        LOG(FATAL, "Only one config file is allowed.")
      configFile = string(file)
    elif not fileExists(file):
      LOG(ERROR, "Cannot find " & file & ". Skipping...")
    else:
      wingsFiles.add(file)

  if configFile.len() > 0:
    USER_CONFIG = config.parse(
      getResult[string](configFile, CONFIG_PREFIX, removePrefix)
    )

  var outputFiles = fromFiles(wingsFiles, USER_CONFIG)
  for files in outputFiles.keys:
    for filetype in outputFiles[files].keys:
      toFile(filetype, outputFiles[files][filetype])

  LOG(INFO, "Time taken: " & $(epochTime() - startTime) & "s")

init(paramCount())
