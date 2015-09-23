module.exports = (robot) ->
  robot.hear /emit/i, (res) ->
  robot.emit 'slack-attachment',
              channel: room
              pretext: "hello dave i am an attachment"
              content:
                fallback: "I'm sorry dave attachment failed"
                color: "d96b38",
                fields: [{
                    title: "TITLE PAGE",
                    value: "Its the End Dave"
                }]
