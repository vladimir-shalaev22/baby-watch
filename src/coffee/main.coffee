init = ->
  connectPopup()

loadProductInfo = (productId) ->
  $.get "products/#{productId}.html", (data) ->
    $(".info-popup__info").html data
    content = $(".info-popup__info")
    title = content.find("h2").text()
    console.log title
    content.find("h2").remove()
    content.find("h3").addClass "info-popup__heading"
    content.find("ul").addClass "info-popup__list"
    content.find("li").addClass "info-popup__item"
    content.find("p").addClass "info-popup__text"
    srcImage = content.find("img").addClass "info-popup__image"
    dstImage = srcImage.clone()
    srcImage.remove()

    $(".info-popup__title").text title
    $(".info-popup__product").empty().append dstImage

    $(window).trigger "open-popup", 1


connectPopup = ->
  $(".js-open-popup").click ->
    self = $ this
    target = self.attr("data-target")
    $(".popup-form__hidden").val target
    $(window).trigger "open-popup", 0
  $(".product__info").click (event) ->
    self = $ this
    event.preventDefault()
    loadProductInfo self.attr("href")[1..]

init()
