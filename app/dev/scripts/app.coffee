#Ruft getPositionPointerXY auf um die Positions des Cursors in die Textarea zu schreiben sobald das Event onmousemove auftritt
$ = require("jquery")
_ = require("underscore")

main = require("../templates/main.html")
login = require("../templates/login.html")

user = {}

showMainTemplate = (userString) ->
	$('#app').html main
	user = JSON.parse userString
	$('#username').html(user.name + " " + user.id)
	logoutEvent()

showLoginTemplate = (userString) ->
	$('#app').html login
	loginEvent()

logoutEvent = () ->
	$("#delete-button").on "click", (event) ->
		localStorage.removeItem("user")
		showLoginTemplate()

loginEvent = () ->
	$("#save-button").on "click", (event) ->
		console.log "test"
		name = $("#username-input").val()
		user.name = name
		user.id = _.uniqueId()

		localStorage.setItem "user", JSON.stringify user
		userString = localStorage.getItem("user")
		showMainTemplate(userString)

$(document).ready ->
	userString = localStorage.getItem("user")
	if userString?
		showMainTemplate(userString)
	else
		showLoginTemplate()





