# Description:
#   Return what garbage day.
#
# Commands:
#   hubot garbage - Return what garbage day today
#   hubot garbage tommorow - Return what garbage day tommorow

module.exports = (robot) ->
  days = [
    ["日", "ごみ収集お休み"]
    ["月", "ゴミ収集お休み"]
    ["火", "一般ごみの日"]
    ["水", "プラスチックの日"]
    ["木", "一般ごみの日"]
    ["金", "資源ごみの日"]
    ["土", "一般ごみの日"]
  ]

  robot.hear /garbage( tommorow)?/i, (msg) ->
    addDays = if msg.match[1] then 1 else 0

    date = new Date
    dayOfTheWeek = date.getDay() + addDays
    if dayOfTheWeek > 6
      dayOfTheWeek = 0

    msg.send days[dayOfTheWeek][0] + "曜日は" + days[dayOfTheWeek][1] + "だねぇ"
