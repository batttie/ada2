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
#   hubot my violations - will list your morality violations
#   hubot show rankings - will rank agents based on violations of morality
# Author:
#   batttie

module.exports = (robot) ->

  words = [
    'abbo',
    'abo',
    'alligatorbait',
    'analannie',
    'analsex',
    'areola',
    'argie',
    'aroused',
    'arse',
    'arsehole',
    'ass',
    'assbagger',
    'assblaster',
    'assclown',
    'asscowboy',
    'asses',
    'assfuck',
    'assfucker',
    'asshat',
    'asshole',
    'assholes',
    'asshore',
    'assjockey',
    'asskiss',
    'asskisser',
    'assklown',
    'asslick',
    'asslicker',
    'asslover',
    'assman',
    'assmonkey',
    'assmunch',
    'assmuncher',
    'asspacker',
    'asspirate',
    'asspuppies',
    'assranger',
    'asswhore',
    'asswipe',
    'backdoor',
    'backdoorman',
    'badfuck',
    'balllicker',
    'balls',
    'ballsack',
    'bastard',
    'bazongas',
    'bazooms',
    'beaner',
    'beatoff',
    'beat-off',
    'beatyourmeat',
    'beaver',
    'bestial',
    'bestiality',
    'biatch',
    'bicurious',
    'bigass',
    'bigbastard',
    'bigbutt',
    'bisexual',
    'bi-sexual',
    'bitch',
    'bitcher',
    'bitches',
    'bitchez',
    'bitchin',
    'bitching',
    'bitchslap',
    'bitchy',
    'blow',
    'blowjob',
    'boang',
    'bogan',
    'bohunk',
    'bollick',
    'bollock',
    'boner',
    'bong',
    'boob',
    'boobies',
    'boobs',
    'booby',
    'boody',
    'boong',
    'boonga',
    'boonie',
    'brea5t',
    'breast',
    'breastjob',
    'breastlover',
    'breastman',
    'bugger',
    'buggered',
    'buggery',
    'bullcrap',
    'bulldike',
    'bulldyke',
    'bullshit',
    'bumblefuck',
    'bumfuck',
    'bunga',
    'bunghole',
    'butchbabes',
    'butchdike',
    'butchdyke',
    'buttbang',
    'butt-bang',
    'choad',
    'chode',
    'clamdigger',
    'clamdiver',
    'clit',
    'clitoris',
    'clogwog',
    'cock',
    'cockblock',
    'cockblocker',
    'cockcowboy',
    'cockfight',
    'cockhead',
    'cockknob',
    'cocklicker',
    'cocklover',
    'cocknob',
    'cockqueen',
    'cockrider',
    'cocksman',
    'cocksmith',
    'cocksmoker',
    'cocksucer',
    'cocksuck',
    'cocksucked' ,
    'cocksucker',
    'cocksucking',
    'cocktail',
    'cocktease',
    'cocky',
    'cohee',
    'coitus',
    'coolie',
    'cornhole',
    'corruption',
    'cra5h',
    'crabs',
    'crack',
    'crackpipe',
    'crackwhore',
    'crack-whore',
    'crap',
    'crapola',
    'crapper',
    'crappy',
    'crotch',
    'crotchjockey',
    'crotchmonkey',
    'crotchrot',
    'cum',
    'cumbubble',
    'cumfest',
    'cumjockey',
    'cumm',
    'cummer',
    'cumming',
    'cumquat',
    'cumqueen',
    'cumshot',
    'cunilingus',
    'cunillingus',
    'cunn',
    'cunnilingus',
    'cunntt',
    'cunt',
    'cunteyed',
    'cuntfuck',
    'cuntfucker',
    'cuntlick' ,
    'cuntlicker' ,
    'cuntlicking' ,
    'cuntsucker',
    'cybersex',
    'cyberslimer',
    'dago',
    'dahmer',
    'dammit',
    'damn',
    'damnation',
    'damnit',
    'darkie',
    'darky',
    'datnigga',
    'deapthroat',
    'deepthroat',
    'defecate',
    'dick',
    'dickbrain',
    'dickforbrains',
    'dickhead',
    'dickless',
    'dicklick',
    'dicklicker',
    'dickman',
    'dickwad',
    'dickweed',
    'diddle',
    'dike',
    'dildo',
    'dingleberry',
    'dink',
    'dipshit',
    'dix',
    'dixiedike',
    'dixiedyke',
    'dong',
    'doodoo',
    'doo-doo',
    'dumbass',
    'dumbbitch',
    'dumbfuck',
    'eatballs',
    'eatme',
    'eatpussy',
    'ejaculate',
    'ejaculated',
    'ejaculating' ,
    'ejaculation',
    'excrement',
    'facefucker'
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
    msg.send "#{event.perpetrator} has been fined for saying the word `#{event.reason}`"

  robot.respond /my violations??/i, (msg) ->
    user = msg.message.user.name
    if robot.brain.data.credit[user] is undefined
      response = "You are an excellent example of morality,\n Be well."
      msg.send response
    else
      response = "#{user}, you have broken the morality statute `#{robot.brain.data.credit[user].length}` time(s):\n"
      for credit in robot.brain.data.credit[user]
        response += "#{credit.perpetrator} for saying `#{credit.reason}`\n"
      msg.send response

  robot.respond /(|show )ranking/i, (msg) ->
    ranking = []

    for person, credit of robot.brain.data.credit
      ranking.push {name: person, points: credit.length}

    sortedRanking = ranking.sort (a, b) ->
      b.points - a.points

    message = "Naughty Agents \n"

    position = 0
    for user in sortedRanking
      position += 1
      message += "#{position}.   Agent  #{user.name}        Number of imprecation(s) `#{user.points}`\n"

    msg.send message

  robot.respond /forget all violations/i, (msg) ->
    #perp = msg.message.user.name
    #delete robot.brain.data.credit[perp]
    #msg.send "Your violations cleared"
    msg.send "I can no longer forgive those who willingly disobey"
