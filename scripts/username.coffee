module.exports = (robot) ->
  robot.hear /name (.*)/i, (res) ->
    name = res.match[1]
    user_id = @client.getUserByName(name).id
    res.send "#{user_id}"
