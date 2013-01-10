root = this
console.log("Hello")

root.clickHandler = (e) ->
	val = $("#index").val()
	$.post '/fibonacci', {index: val}, root.fibonacciResponseHandler
	return false

root.fibonacciResponseHandler = (resp) ->
	$('span.result').text(resp)

root.init = ->
	$("button.calculate").click(root.clickHandler)

$ -> root.init()
