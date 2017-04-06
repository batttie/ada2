module.exports = (robot) ->
  robot.hear /count (.*)/i, (res) ->
    num = res.match[1]
    lyrics = while num -= 1
      song =  "#{num} little monkeys, jumping on the bed.\nOne fell out and bumped his head."
      res.send "#{song}"
