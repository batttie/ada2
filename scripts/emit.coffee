modules.export = (robot) ->
  robit.hear /emit/i, (res)
  robot.emit 'slack-attachment',
              channel: testing
              fallback: "I'm sorry dave attachment failed"
              content:
                color: "d96b38",
                fields: [{
                    title: "TITLE PAGE",
                    value: "Its the End Dave"
                }]
