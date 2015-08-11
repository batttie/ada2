#
#
#
module.exports = (robot) ->
  robot.hear /room/i, (res) ->
  get_channel = (response) ->
    if response.message.room == response.message.user.name
     "@#{response.message.room}"
    else
    "##{response.message.room}"
    res.send 'get_channel'
