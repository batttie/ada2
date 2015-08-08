module.exports = (robot) ->
  robot.hear /helpmenu/i, (res) ->
    res.reply "here is a list of useful commands:
\n /cycle all septicycle information 
\n `/checkpoint` - `/checkpoint all` , `/checkpoint 8` - next checkpoints
\n 'farm/CITYNAME ----local farm info
\n `/away` - Toggle your 'away' status
\n`/close` ( or `/leave`, `/part`) - Close a channel, group, or DM
\n `/collapse` - Collapse images/video `/expand` - Expand images/video
\n`/feed help` [or subscribe, list, remove] | /feedback - send feedback to Slack | `/invite @user [channel]`
\n`/me your message` - displays action text `/msg` (or `/dmg`) @ user [your message] `/open` (or `/join`) [channel] 
\n`/prefs` - Open the preferences dialog
\n `/remind me in <time> to <message> `
\n `/rename [new name] `- Renames a channel or group
\n /shortcuts (or /keys) - Open the keyboard shortcuts dialog"
