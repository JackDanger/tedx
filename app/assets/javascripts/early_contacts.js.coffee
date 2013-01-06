$ ->
  $("form#new_early_contact").submit ->
    form  = $(this)
    email = $("input#early_contact_email")
    name  = $("input#early_contact_name")
    info  = form.find(".info")

    if "" == $.trim(email.val()) || !email.val().match(/@/)
      $("#missing_email").show()
      email.focus()
      return false
    else
      $("#missing_email").hide()

    $.post form.attr('action'),
           form.serialize(),
           (response) ->
             if response.persisted
               form.hide()
               $("#thanks").show()
             else
               info.text("")
               info.append $("<div>There were errors:</div>")
               $.each response.errors, ->
                 info.append $("<div>" + this + "</div>")
    return false
