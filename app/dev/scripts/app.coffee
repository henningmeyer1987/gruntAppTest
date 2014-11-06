#Ruft getPositionPointerXY auf um die Positions des Cursors in die Textarea zu schreiben sobald das Event onmousemove auftritt
$ = require("jquery")
_ = require("underscore")

user = {}

$("#local-storage").prop("disabled", true)
$(document).ready ->
	userString = localStorage.getItem("user")

	if userString?
		user = JSON.parse userString
		$('#no-user').css('display', 'none')
		$('#user-exists').css('display', 'block')
		$('#username').html(user.name + " " + user.id)
	else
		$('#no-user').css('display', 'block')
		$('#user-exists').css('display', 'none')	

	#localStorage.removeItem("username")
	$("#save-button").on "click", (event) ->
		name = $("#username-input").val()
		user.name = name
		user.id = _.uniqueId()

		localStorage.setItem "user", JSON.stringify user
		window.location.reload()

	$("#delete-button").click ->
		localStorage.removeItem("user")
		window.location.reload()
