yargs       = require 'yargs'
Task        = require 'task-registry'
require 'task-registry-template-engine-lodash'
require 'task-registry-file-template'
require 'task-registry-file-copy'
require 'task-registry-file-mkdir'
require 'task-registry-file-layout'
require 'task-registry-isdk' #register the isdk task
require './tasks/echo'

argv     = yargs
  .count('verbose')
  .alias('v', 'verbose')
  .argv

isdkTask = Task 'isdk'

argv.cwd = if argv._.length then argv._[0] else '.'
loglevel = argv.verbose
if loglevel > 0
  argv.logger = level:loglevel+3

isdkTask.executeSync argv
