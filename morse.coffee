theLine = (0 for i in [1..30])

drawSquare = (x) ->
  canvas = $('#theline')[0]
  if canvas.getContext
    ctx = canvas.getContext('2d')
    ctx.fillRect(x,0,x + 5,5);

clearSquare = (x) ->
  canvas = $('#theline')[0]
  if canvas.getContext
    ctx = canvas.getContext('2d')
    ctx.clearRect(x, 0, x + 5, 5)

drawLine = ->
  x = 0
  for each in theLine
    x += 5
    if each is 1
      drawSquare(x)
    else
      clearSquare(x)

setInterval(drawLine, 100)

mouseDown = false

moveLine = ->
  newLine = []
  if mouseDown
    newLine.push(1)
  else
    newLine.push(0)
  for i in [0..28]
    newLine.push(theLine[i])
  theLine = newLine

setInterval(moveLine, 100)

$ ->
    # DOMContentLoaded
    $('#button').mousedown ->
        mouseDown = true
    $('#button').mouseup ->
        mouseDown = false
