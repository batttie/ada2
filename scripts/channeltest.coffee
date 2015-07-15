#
#
#
module.exports = (robot) ->
  robot.hear /pss/i, (msg) ->
    msg.reply envelope.room
    
  
  robot.topic (res) ->
   res.send "#{res.message.text}? That's a Paddlin'"
