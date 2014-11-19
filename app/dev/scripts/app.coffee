#Ruft getPositionPointerXY auf um die Positions des Cursors in die Textarea zu schreiben sobald das Event onmousemove auftritt
$ = require("jquery")
_ = require("underscore")
backbone = require("backbone")


main = require("../templates/main.html")
login = require("../templates/login.html")
User = require("./user.coffee")


SearchView = backbone.View.extend(
	initialize: ->
		@render()
		return

	render: ->
		# Compile the template using underscore
		template = _.template($("#search_template").html(), {})
		# Load the compiled HTML into the Backbone "el"
		@$el.html template
		return

	events:
		"click input[type=button]": "doSearch"

	doSearch: (event) ->
		# Button clicked, you can access the element that was clicked with event.currentTarget
		alert "Search for " + $("#search_input").val()
		return
)


showMainTemplate = () ->
	$('#app').html main
	$('#username').html(User.get("name") + " " + User.get("id"))
	logoutEvent()

showLoginTemplate = (userString) ->
	$('#app').html login
	loginEvent()

logoutEvent = () ->
	$("#delete-button").on "click", (event) ->
		User.destroy()
		showLoginTemplate()

loginEvent = () ->
	$("#save-button").on "click", (event) ->
		name = $("#username-input").val()
		User.set("id", _.uniqueId())
		User.set("name", name)
		User.save()
		showMainTemplate()

$(document).ready ->
	if User.fetch() is true
		showMainTemplate()
	else
		showLoginTemplate()





