# Description:
#   Watch your language!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   whitman, jan0sch

module.exports = (robot) ->

  words = [
    'arsch',
    'arschloch',
    'arse',
    'ass',
    'bastard',
    'bitch',
    'bugger',
    'bollocks',
    'bullshit',
    'cock',
    'cunt',
    'damn',
    'damnit',
    'depp',
    'dick',
    'douche',
    'fag',
    'fotze',
    'fuck',
    'fucked',
    'fucking',
    'kacke',
    'piss',
    'pisse',
    'scheisse',
    'schlampe',
    'shit',
    'wank',
    'wichser'
  ]
  regex = new RegExp('(?:^|\\s)(' + words.join('|') + ')(?:\\s|\\.|\\?|!|$)', 'i');
  robot.brain.data.credit ||= {}
  robot.hear regex, (msg) ->
    perp = msg.message.user.name
    reason = msg.match[0]
    msg.send 'You have been fined one credit for a violation of the verbal morality statute.\n Be well.'

    robot.brain.data.credit[perp] ||= []
    event = {reason: reason, perpetrator: perp}
    robot.brain.data.credit[perp].push event
    msg.send "#{event.perpetrator} has been fined for saying thet word #{event.reason}"

  robot.respond /my violations??/i, (msg) ->
    user = msg.message.user.name
    response = "#{user}, #{robot.brain.data.credit[user].length} time(s) someone thanked you:\n"
    for credit in robot.brain.data.credit[user]
      response += "#{credit.perpetrator} for #{credit.reason}\n"
    msg.send response

  robot.respond /(|show )ranking/i, (msg) ->
    ranking = []

    for person, credit of robot.brain.data.credit
      ranking.push {name: person, points: credit.length}

    sortedRanking = ranking.sort (a, b) ->
      b.points - a.points

    message = "Ranking\n"

    position = 0
    for user in sortedRanking
      position += 1
      message += "#{position}. #{user.name} - #{user.points}\n"

    msg.send message

  robot.respond /forget all violations/i, (msg) ->
    delete robot.brain.data.credit
    robot.brain.data.credit ||= {}
    msg.send "Violations cleared"
