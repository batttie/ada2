module.exports = (robot) ->
  intro = "Hello, I am ADA, human cyborg relations.  I am fluent in over 6 million forms of communication. I am one of the group of droids that serve the agents of MontereyBay.\n  My counterparts incude `notada`, `farmbot`,`edify` and lastly `slackbot`\nFor a list of my commands type `@ada help` and I will respond back with commands.\nFor slack general help say `helpmenu` and I will share my knowoledge accordingly.\nHow might I serve you?"
  robot.hear /who are you/i, (res) ->
       robot.send {room: res.envelope.user.name}, intro
  robot.hear /introduce yourself/i, (res) ->
       res.send intro
