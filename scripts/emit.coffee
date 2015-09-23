module.exports = (robot) ->
  robot.hear /emit/i, (res) ->
    robot.emit 'slack-attachment',
      message: res.message
      content:
      # see https://api.slack.com/docs/attachments
        text: "Attachment text"
        fallback: "Attachment fallback"
        fields: [{
          title: "Field title"
          value: "Field value"
         }]
        channel: "#testing" # optional, defaults to message.room
        username: "foobot" # optional, defaults to robot.name
