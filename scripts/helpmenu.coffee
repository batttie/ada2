module.exports = (robot) ->
  robot.hear /helpmenu/i, (res) ->
    res.reply "here is a list of useful commands:
\n /cycle all septicycle information 
\n `/checkpoint` - `/checkpoint all` , `/checkpoint 8` - next checkpoints
\n 'farm/CITYNAME ----local farm info
             `/away` - Toggle your 'away' status
             `/close` ( or `/leave`, `/part`) - Close a channel, group, or DM
             `/collapse` - Collapse images/video `/expand` - Expand images/video
             `/feed help` [or subscribe, list, remove] | /feedback - send feedback to Slack | `/invite @user [channel]`
             `/me your message` - displays action text `/msg` (or `/dmg`) @ user [your message] `/open` (or `/join`) [channel] 
             `/prefs` - Open the preferences dialog
             `/remind me in <time> to <message> `
             `/rename [new name] `- Renames a channel or group
             /shortcuts (or /keys) - Open the keyboard shortcuts dialog"
