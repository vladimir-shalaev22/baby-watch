## Popup Controller

# Views
overlay = $(".popup-overlay")

popups = [
  "popup-form"
  "info-popup"
]

# Инициализация контроллера
init = ->
  $(window).on "open-popup", openPopup
  $(window).on "form-sent", ->
    closePopup 0
  overlay.css "visibility", "hidden"
  overlay.click (event) ->
    event.stopPropagation()
    closePopup 0
    closePopup 1
  initPopups()

# Инициализация попапов
initPopups = ->
  for popup, id in popups
    el = $ ".#{popup}"
    mod = "#{popup}_state_open"
    el.css "visibility", "hidden"
    do (id) ->
      el.find(".js-close").click (event) ->
        event.stopPropagation()
        console.log id
        closePopup id
    popups[id] = [el, mod]

# Action: открывает попап
openPopup = (event, id) ->
  position = $(window).scrollTop()
  popup = popups[id]

  overlay.css("visibility", "visible").addClass "popup-overlay_state_visible"
  popup[0].css("visibility", "visible").addClass popup[1]
  popup[0].css("margin-top", position)

# Action: закрывает попап
closePopup = (id) ->
  popup = popups[id]
  overlay.removeClass "popup-overlay_state_visible"
  popup[0].removeClass popup[1]
  setTimeout ->
    overlay.css "visibility", "hidden"
    popup[0].css "visibility", "hidden"
  , 600

init()
