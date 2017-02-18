# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  
  $("#tag_select, #sub_tag_select").chosen();

  # articles new page
  $('#tag_select').chosen().change (e, params) ->
    e.preventDefault()
    load_sub_tags(params.selected, $('#sub_tag_select'), true)
    return

  # Tag filter
  $('#filter_tag').on 'change', (e) ->
    e.preventDefault()
    load_sub_tags($(this).val(), $('#filter_sub_tag'))
    return

  # Function to load sub tag select options
  load_sub_tags = (tag, el, chosen=false) ->
    $.ajax
      url: '/articles/get_sub_tags'
      data: {tag: tag}
      success: (data) ->
        if !chosen
          el.empty()
          el.append $('<option></option>').attr('value', '').text('Choose Sub Tag')
        $.each data, (i, tag) ->
          el.append $('<option></option>').attr('value', tag.id).text(tag.name)
          return
        el.trigger("chosen:updated");
        return  

  
    



  


