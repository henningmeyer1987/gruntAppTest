#Ruft getPositionPointerXY auf um die Positions des Cursors in die Textarea zu schreiben sobald das Event onmousemove auftritt
$ = require("jquery")
_ = require("underscore")

###
class User
	id: null
	name: null
	age: null
	constructor: () ->
		
	set: (attribute_name, attribute_value) ->
		@[attribute_name] = attribute_value


user = new User()

user.set("name", "horst")
user.set("id", 1)
user.set("age", 21)
user.name = "harry"
console.log user
###
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


###$(document).mousemove (event) ->
	getPositionPointerXY(event)

getPositionPointerXY = (event) ->
	#Ermitteln der Position des Mouse Cursors
	xPosition = event.pageX
	yPosition = event.pageY
	#Output der Funktionen wird in einer Variable gespeichert
	positionOutput = 'Position: ' + xPosition + ', ' + yPosition

	#Auswählen der Textarea in dem die Position angezeigt wird
	textareaPointer = $('#pointer-textarea')

	#Ausgabe der Position in der eben ausgewählten Textarea
	textareaPointer[0].value = positionOutput

	#Positioniert das Div direkt am Mauszeiger
	$(".background-div").css
		top: yPosition + "px"
		left: xPosition + "px"###
