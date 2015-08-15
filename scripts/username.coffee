module.exports = (robot) ->
  robot.hear /name (.*)/i, (msg) ->
  # Replace @username with <@UXXXXX> for mentioning users
    name = res.match[1]
    #msg.replace /(?:^@| @)([A-z]+)/gm, (match, p1) =>
    #try
      user_id = @client.getUserByName(name).id
      #match = ' <@' + user_id + '>'
    #catch
      #match = match

     
     #message = "hi"
     res.send "#{user_id}"
