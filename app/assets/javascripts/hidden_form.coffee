class HiddenForm
  constructor: (el)->
    @el = el
    @$el =$(el)

    @show_button = $(".show-form-button", @$el)
    @hidden_form = $(".hidden-section", @$el)
    @close_button= $(".close-form-button", @$el)

    @bindings()

  bindings: (el)->
    @show_button.on "click", @showForm
    @close_button.on "click", @hideForm

  showForm: (event) =>
    event.preventDefault()
    @hidden_form.show()

  hideForm: (event) =>
    event.preventDefault()
    @hidden_form.hide()

$ ->
  new HiddenForm($(".hidden-form"))
