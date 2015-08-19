modules.export = (robot) ->
 robot.enter (msg) ->
   msg.send "#{msg.message.user.name}"
