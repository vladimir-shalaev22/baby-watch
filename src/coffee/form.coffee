### Контроллер всплывающей формы ###

# Views
form = $ ".popup-form"
inputs = form.find "input"

# Инициализация формы
init = ->
  form.find(".popup-form__submit").click submitForm

# Отправка формы
submitForm = ->
  data = {}

  inputs.each ->
    input = $ this
    data[input.attr "name"] = input.val()

  if isValid data
    $.post "send-request.php", data, ->
      alert "Ваша заявка успешно отправлена!"
    $(window).trigger "form-sent", data

  return false

# Проверка формы
isValid = (data) ->
  if data.name.length < 3
    alert "Пожалуйста, введите Ваше имя!"
    return false

  if data.contact.length < 3
    alert "Пожалуйста, введите Ваши контактные данные!"
    return false

  return true

init()
