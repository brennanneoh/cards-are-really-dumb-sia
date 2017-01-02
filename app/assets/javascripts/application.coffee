#= require jquery3
#= require tether
#= require bootstrap
#= require turbolinks
#= require_tree .

$(document).on 'turbolinks:load', () ->
  load_javascript $('body').data('controller'), $('body').data('action')

load_javascript = (controller, action) ->
  $(document).trigger "#{controller}.load"
  $(document).trigger "#{action}_#{controller}.load"
