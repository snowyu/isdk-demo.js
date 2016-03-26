Task            = require 'task-registry'

# module.exports = Task.defineFunction ['EchoTask', 'echo'], params:['hi'], fnSync:(value)->
#   @logger.info 'echo:', value
#   value

register        = Task.register
aliases         = Task.aliases

module.exports = class EchoTask
  register EchoTask
  aliases EchoTask, 'echo'

  _executeSync: (aFile)->
    @logger.info 'echo', aFile
    aFile

