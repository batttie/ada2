#
#
#
#
#
#
#
#
module.exports = (robot) ->
  robot.brain.data.inventory ||= {}
  robot.hear /I have (.*) (.*), (res) ->
    agent = msg.message.user.name
    item = msg.match[1]
    count = msg.match[2]
    msg.send 'Ok @#{agent} you have `#{count}` of *#{item}*'

#    robot.brain.data.credit[perp] ||= []
#    event = {reason: reason, perpetrator: perp}
#    robot.brain.data.credit[perp].push event
#    msg.send "#{event.perpetrator} has been fined for saying thet word `#{event.reason}`"
#
#  robot.respond /my violations??/i, (msg) ->
#    user = msg.message.user.name
#    if robot.brain.data.credit[user] is undefined
#      response = "You are an excellent example of morality,\n Be well."
#      msg.send response
#    else
#      response = "#{user}, you have broken the morality statue `#{robot.brain.data.credit[user].length}` time(s):\n"
#      for credit in robot.brain.data.credit[user]
#        response += "#{credit.perpetrator} for saying `#{credit.reason}`\n"
#      msg.send response
#
#  robot.respond /(|show )ranking/i, (msg) ->
#    ranking = []
#
#    for person, credit of robot.brain.data.credit
#      ranking.push {name: person, points: credit.length}
#
#    sortedRanking = ranking.sort (a, b) ->
#      b.points - a.points

#    message = "Naughty Agents \n"

#    position = 0
#    for user in sortedRanking
#      position += 1
#      message += "#{position}.   Agent  #{user.name}        Number of imprecation(s) `#{user.points}`\n"

#    msg.send message