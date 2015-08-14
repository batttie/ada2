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
  robot.respond /greetingss ([\w.-]*):? (.*)/i, (msg) ->
    username = msg.match[1]
    user = robot.brain.userForId msg.envelope.user.id
    robot.logger.info "user: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
    robot.send {room: msg.envelope.user.name}, "#{tellmessage}"
    