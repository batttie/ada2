module.exports = (robot) ->
  robot.hear /helpmenu/i, (res) ->
    user = robot.brain.userForId res.envelope.user.id
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{res.envelope.user.id}"
    helpmsg = "here is a list of useful commands:
\n *Slack Commands*
\n `/away` - Toggle your 'away' status
\n`/close` , `/leave`, `/part` - Close a channel, group, or DM
\n `/collapse` - Collapse images/video `/expand` - Expand images/video
\n`/feed help` [or subscribe, list, remove] | /feedback - send feedback to Slack | 
\n `/invite @user [channel]`
\n`/me {your message}` - displays action text 
\n`/msg` or `/dmg` @ user [your message] private message a user
\n`/open` or `/join` [channel] - Join a channel
\n`/prefs` - Open the preferences dialog
\n `/remind me in <time> to <message> `
\n `/rename [new name] `- Renames a channel or group
\n `/shortcuts` or `/keys` - Open the keyboard shortcuts dialog
\n *Ingress Related Commands*
\n `/cycle` or `/cycle all` septicycle information 
\n `/checkpoint` , `/checkpoint all` , `/checkpoint {#}` - next checkpoints
\n `farm/{city name}` - local farm info
\n `/code {PASSCODE}` - Sends a passcode to other teams.  Check out #codes
\n `/portal {search} {Portal Title}` - Seacrches for specific portal information.  Try `/portal help` for more info"

    res.reply "I am sending you a dm now!"
    robot.send {room: res.envelope.user.name}, helpmsg
