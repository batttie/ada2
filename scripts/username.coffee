module.exports = (robot) ->
  # Replace @username with <@UXXXXX> for mentioning users
    msg = msg.replace /(?:^@| @)([A-z]+)/gm, (match, p1) =>
    try
      user_id = @client.getUserByName(p1).id
      match = ' <@' + user_id + '>'
    catch
      match = match
    robot.hear /name (.*)/i, (msg) ->
     name = res.match[1]
     message = "hi"
     robot.send {room: message.envelope.user.name}, message
  
