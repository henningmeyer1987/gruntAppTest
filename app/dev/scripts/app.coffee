#Ruft getPositionPointerXY auf um die Positions des Cursors in die Textarea zu schreiben sobald das Event onmousemove auftritt
$ = require("jquery")
_ = require("underscore")
backbone = require("backbone")


main = require("../templates/main.html")
login = require("../templates/login.html")
User = require("./user.coffee")

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





