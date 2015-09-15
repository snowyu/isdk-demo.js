Task            = require 'task-registry'
register        = Task.register
aliases         = Task.aliases

module.exports = class EchoTask
  register EchoTask
  aliases EchoTask, 'echo'

  _executeSync: (aFile)->
    aFile

