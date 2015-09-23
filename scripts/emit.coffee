module.exports = (robot) ->
  robot.hear /emit/i, (res) ->
    robot.emit 'slack-attachment',
      message: msg.message
      content:
      # see https://api.slack.com/docs/attachments
        text: "Attachment text"
        fallback: "Attachment fallback"
        fields: [{
          title: "Field title"
          value: "Field value"
         }]
        channel: "#general" # optional, defaults to message.room
        username: "foobot" # optional, defaults to robot.name
