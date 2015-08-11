#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    get_channel = (response) ->
      if response.message.room == response.message.user.name
        "@#{response.message.room}"
      else
        "##{response.message.room}
    msg.send get_channel
  
