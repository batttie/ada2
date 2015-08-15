module.exports = (robot) ->
  robot.hear /name (.*)/i, (msg) ->
  # Replace @username with <@UXXXXX> for mentioning users
    msg.replace /(?:^@| @)([A-z]+)/gm, (match, p1) =>
    try
      user_id = @client.getUserByName(p1).id
      match = ' <@' + user_id + '>'
    catch
      match = match

     #name = res.match[1]
     message = "hi"
     robot.send {room: message.envelope.user.name}, message
