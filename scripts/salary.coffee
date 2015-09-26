# Description:
#   Salary day is a day that I get pocket money.

cronJob = require('cron').CronJob

module.exports = (robot) ->
  postMsg = "明日は給料日だから、パパにお小遣いあげよう！"

  job = new cronJob
    cronTime: "0 0 18 24 * *"
    onTick: ->
      robot.send {room: "#general"}, postMsg
      return
    start: true
    timeZone: "Asia/Tokyo"

  robot.respond /salary now/i, (msg) ->
    msg.send postMsg
