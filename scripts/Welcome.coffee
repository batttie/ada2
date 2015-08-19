#
# Description:
#Sends a generic welcome message to New users of Slack.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
# greetingsw (@USER)
#
# Author:
#   batttie
tellmessage = "Welcome to the Slack Chat of the Monterey Bay & Surrounding areas"
module.exports = (robot) ->
  robot.hear /new user (.*)/i, (msg) ->
    username = msg.match[1]
    user = robot.brain.userForId username
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
    robot.send {room: user}, "#{tellmessage}"
    
