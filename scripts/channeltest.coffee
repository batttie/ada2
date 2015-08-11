#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    channel = @client.getChannelGroupOrDMByID msg.envenlope.channel.id
    room = channel.name
    msg.reply room
  
