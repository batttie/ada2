module.exports = (robot) ->
  robot.hear /howdy (.*)/i, (msg) ->
    nu= msg.match[1]
    wmessage = "greets @{nu} have you tried the #codes channel lately"
    msg.send wmessage
 
  
