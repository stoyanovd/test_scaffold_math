class MathJax
  constructor: (@options) ->
    @bind()

  load: =>
    window.MathJax = null
    @_fetch().done =>
      window.MathJax.Hub.Config @options

  bind: ->
    $ => @load()
    $(document).on 'page:load', @load

  unbind: ->
    $(document).off 'page:load', @load

  # private

  _fetch: ->
    $.ajax
      dataType: 'script'
      cache: true
      url: "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"


new MathJax
  showMathMenu: false