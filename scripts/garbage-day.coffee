# Description:
#   Return what garbage day.
#
# Commands:
#   hubot garbage - Return what garbage day today
#   hubot garbage tommorow - Return what garbage day tommorow

module.exports = (robot) ->
  days = [
    ["日", "ごみ収集お休み"]
    ["月", "プラスチック"]
    ["火", "一般ごみ"]
    ["水", "資源ごみ"]
    ["木", "一般ごみ"]
    ["金", "ごみ収集お休み"]
    ["土", "一般ごみ"]
  ]

  robot.hear /garbage( tommorow)?/i, (msg) ->
    addDays = if msg.match[1] then 1 else 0

    date = new Date
    dayOfTheWeek = date.getDay() + addDays
    if dayOfTheWeek > 6
      dayOfTheWeek = 0

    msg.send days[dayOfTheWeek][0] + "曜日は" + days[dayOfTheWeek][1] + "の日だねぇ"
