# Description:
#   heroku sleep notifier
#   refs:http://shokai.org/blog/archives/10108

module.exports = (robot) ->

  ## 起きた時、slack-adapterがつながるのを待って通知
  cid = setInterval ->
    return if typeof robot?.send isnt 'function'
    robot.send {room: "#x-test"}, "むくり"
    clearInterval cid
  , 1000

  ## 寝た時、通知してからexitする
  on_sigterm = ->
    robot.send {room: "#x-test"}, 'すやー'
    setTimeout process.exit, 1000

  if process._events.SIGTERM?
    process._events.SIGTERM = on_sigterm
  else
    process.on 'SIGTERM', on_sigterm
