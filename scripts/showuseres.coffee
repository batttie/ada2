module.exports = (robot) ->
  robot.hear /howdy (.*)/i, (msg) ->
    nu= msg.match[1]
    message = "greets @{nu} have you tried the #codes channel lately"
 
  
