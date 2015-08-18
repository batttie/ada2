module.exports = (robot) ->
  robot.hear /show (.*)/i, (msg) ->
    noob = msg.match[1]
    msg = msg.replace /(?:^| )@([\w]+)/gm, (match, p1) =>
     user = robot.brain.userForId
     match = match.replace /@[\w]+/, "#{user.id}"
   
    robot.logger.info "noob: #{noob}\nuser: #{user}\nid: #{user.id}\nroom: #{msg.envelope.user.id}"
  
