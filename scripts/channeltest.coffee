#
#
#
module.exports = (robot) ->
  robot.hear /room/i,(msg) ->
    channel = @client.getChannelGroupOrDMByID msg.channel.id
    room = channel.name
    msg.reply room
  
