### Контроллер слайдера ###

# Views
views = {
  slider: "slider"
  left: "slider__arrow_left"
  right: "slider__arrow_right"
  content: "slider__content"
}

# Переключаем к предыдущему слайду
prevSlide = ->
  if locked is on or currentFrame is 0
    return
  locked = on
  currentFrame -= 1
  offset = 0 - currentFrame * 100.0 / framesCount
  views.content.css "transform", "translate(#{offset}%)"
  setTimeout ->
    locked = off
  , 500

# Переключаем к следующему слайду
nextSlide = ->
  if locked is on or currentFrame is framesCount - 1
    return
  locked = on
  currentFrame += 1
  offset = 0 - currentFrame * 100.0 / framesCount
  views.content.css "transform", "translate(#{offset}%)"
  setTimeout ->
    locked = off
  , 500

# Callbacks
callbacks = [
  ["left", "click", prevSlide]
  ["right", "click", nextSlide]
]

# State
framesCount = 7
currentFrame = 0
locked = off

# Инициализация контроллера
init = ->
  initViews()
  connectCallbacks()

# Инициализация отображений
initViews = ->
  for view, selector of views
    views[view] = $ ".#{selector}"

# Подключение обратных вызовов
connectCallbacks = ->
  for cb in callbacks
    eventSource = cb[0]
    eventType = cb[1]
    eventHandler = cb[2]
    views[eventSource].on eventType, eventHandler

init()
