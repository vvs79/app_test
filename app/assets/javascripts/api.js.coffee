jQuery ->
  if $('#test-1').length
    $(document).on 'click', '.butt-test-1', (e) ->
      e.preventDefault()
      $.ajax
        type: 'GET'
        data: {str: $('#test-1').val()}
        url: "/api/v1/set_ranges"
        success: (data) ->
          $('div.result-test-1').hide()
          if data.result
            $('div.result-test-1').show()
            $('div.result-test-1').find('span.result').text(data.result)

  if $('#test-2').length
    $(document).on 'click', '.butt-test-2', (e) ->
      e.preventDefault()
      $.ajax
        type: 'GET'
        data: {str: $('#test-2').val()}
        url: "/api/v1/set_5_letters"
        success: (data) ->
          $('div.result-test-2').hide()
          if data.result
            str = data.result.join('<br>')
            $('div.result-test-2').show()
            $('div.result-test-2').find('p.result').append(str)

  if $('#file').length
    $(document).on 'change', '#file', ->
      $(this).parents('form').submit()
