#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    channel = @client.getChannelGroupOrDMByID msg.channel
    room = channel.name
    msg.reply room
  
