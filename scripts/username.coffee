modules.exoprt = (robot) ->
  robot.hear /name (.*)/i, (res) ->
  name = msg.match[1]
  res.send "#{name}"
  
