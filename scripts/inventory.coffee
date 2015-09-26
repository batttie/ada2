#
#
#
#
#
#
#
#
module.exports = (robot) ->
  robot.brain.data.iinventory ||= {}
  robot.hear /i have (.*) (.*)/i, (res) ->
    agentc = res.message.user.name
    countn = res.match[1]
    iitem = res.match[2]
    res.send "Ok @#{agentc} you have `#{countn}` of *#{iitem}*"
    robot.brain.data.iinventory[agentc] ||= []
    ievent = {agent: agentc, item: iitem, number: countn}
    robot.brain.data.iinventory[agentc].push ievent
    res.send "#{ievent.agent} has #{ievent.number} of  #{ievent.item}"

  robot.respond /my inventory??/i, (res) ->
    agentc = res.message.user.name
    if robot.brain.data.iinventory[agentc] is undefined
      response = "I do not know what is in your inventory."
      res.send response
    else
      response = "#{agentc}, this is your inventory:\n"
      for iinventory in robot.brain.data.iinventory[agentc]
        response += "#{iinventory.item}  `#{iinventory.number}`\n"
      res.send response

  robot.respond /clear my inventory/i, (res) ->
    agentc = res.message.user.name
    delete robot.brain.data.iinventory[agentc]
    robot.brain.data.iinventory[agentc] ||= []
    res.send "Inventory cleared"

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
