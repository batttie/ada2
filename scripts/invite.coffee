
slackcomm = 'enl-monterey'
slacktoken = 'xoxp-2886416911-2972267514-6905744660-12b73a'
slackInviteUrl = "https://" + slackcomm + ".slack.com/api/users.admin.invite"
module.exports = (robot) ->
  robot.hear /send invite (.*)/i, (res) ->
    rawemail = res.match[1]
    email = rawemail.replace(/m.*\|/gi, "")
    form =
      email: email
      token: slacktoken
      set_active: true
    robot.http(slackInviteUrl)
    .post (form) (err, msg, body) ->
      res.send "#{err}, #{msg}, #{body}\n#{slackInviteUrl}\n#{slacktoken}\n#{email}\n#{form}"
