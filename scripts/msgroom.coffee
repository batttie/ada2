module.exports = (robot) ->
  robot.respond /hello$/i, (msg) ->
  robot.messageRoom '#testing', 'hello there'
