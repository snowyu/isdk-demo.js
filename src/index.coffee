Task        = require 'task-registry'
require 'task-registry-template-engine-lodash'
require 'task-registry-file-template'
require 'task-registry-file-copy'
require 'task-registry-file-mkdir'
require 'task-registry-isdk' #register the isdk task
require './tasks/echo'

isdkTask = Task 'isdk'
isdkTask.executeSync cwd: '.'
