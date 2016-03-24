# Description:
#   catme is the most important thing in your life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cat me - Receive a cat
#   hubot cat bomb N - get N cats

MAX_CATS = 100

module.exports = (robot) ->

  robot.respond /cat me/i, (msg) ->
    msg.http("http://random.cat/meow")
      .get() (err, res, body) ->
        data = JSON.parse(body)
        msg.send data['file']

  robot.respond /cat bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    if count > MAX_CATS
      msg.send "uh uh uh http://i.imgur.com/ekH5WgN.gif"
    else
      for x in [0..count]
        msg.http("http://random.cat/meow")
          .get() (err, res, body) ->
            data = JSON.parse(body)
            msg.send data['file']
