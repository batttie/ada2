module.exports = (robot) ->
  robot.hear /count (.*)/i, (res) ->
    num = res.match[1]
    lyrics = while num -= 1
      "#{num} little monkeys, jumping on the bed.
    One fell out and bumped his head."
      res.send lyrics
