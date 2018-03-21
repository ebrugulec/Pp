$(document).on "click", "a.remove_answer", (e)->
  console.log(e)

  remove = $(this).parent()
  remove.children("input[type=hidden]").val(true)
  remove.hide()
  e.preventDefault()

$(document).on "click", "a.remove_question", (e)->
  remove = $(this).parent()
  # b = remove.find( 'class:hid')
  # # for g in b
  # #   do ->
  # #     if g.class == null
  # console.log(remove[])


  e.preventDefault()
