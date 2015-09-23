module.exports = (robot) ->
  robot.hear /emit/i, (res) ->
    robot.emit 'slack-attachment',
              channel: "C03DQDDSK"
              fallback: "I'm sorry dave attachment failed"
              content:
                color: "d96b38",
                fields: [{
                    title: "TITLE PAGE",
                    value: "Its the End Dave"
                }]
