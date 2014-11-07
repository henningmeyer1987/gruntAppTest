#Ruft getPositionPointerXY auf um die Positions des Cursors in die Textarea zu schreiben sobald das Event onmousemove auftritt
$ = require("jquery")
_ = require("underscore")

main = require("../templates/main.html")
login = require("../templates/login.html")

user = {}
class Animal
	name:null
	selectAnimal: (animal_name) ->
		@name = animal_name

Tiger = new Animal()

Tiger.selectAnimal("White Tiger")

addChainedAttributeAccessor = (obj, propertyAttr, attr) ->
	obj[attr] = (newValues...) ->
		if newValues.length == 0
			obj[propertyAttr][attr]
		else
			obj[propertyAttr][attr] = newValues[0]
			obj



class AnimalDetails
	@_animals: 0
	@get_count: ->
		@_animals
	constructor:  ->
		@animalinfo=
			name: null
			diet: null
			population: null
			age:null
		addChainedAttributeAccessor(this, 'animalinfo', attr) for attr of @animalinfo
		@constructor._animals++

console.log AnimalDetails.get_count()

TigerDetails = new AnimalDetails().name(Tiger.name).diet("Meat").population(1000).age(25)


console.log TigerDetails.animalinfo

console.log AnimalDetails.get_count()
console.log Tiger.name 

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





