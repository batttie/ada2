#
#
#
module.exports = (robot) ->
 get_channel = (response) ->
    f response.message.room == response.message.user.name
     "@#{response.message.room}"
   else
    "##{response.message.room}"
