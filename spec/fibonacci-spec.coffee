describe "click calls clickHandler", ->
	Given -> affix("button.calculate")
	Given -> spyOn(window, 'clickHandler')
	# Important to spy on the clickHandler before binding it
	Given -> init()

	When -> $("button.calculate").click()

	Then -> expect(window.clickHandler).toHaveBeenCalled()

describe "clickHandler submits POST", ->
	Given -> affix('input#index[value="5"]')
	Given -> spyOn($, 'post').andCallFake( (url, data, resp) ->
		resp() )
	Given -> spyOn(window, 'fibonacciResponseHandler')

	When -> clickHandler()

	Then -> expect($.post).toHaveBeenCalled()
	Then ->	expect($.post.mostRecentCall.args[1]['index']).toEqual("5")
	Then -> expect(window.fibonacciResponseHandler).toHaveBeenCalled()

describe "POST response is written to .result", ->
	Given -> affix('span.result')

	When -> fibonacciResponseHandler("5")

	Then -> expect($('span.result').text()).toEqual("5")
