#Ruft getPositionPointerXY auf um die Positions des Cursors in die Textarea zu schreiben sobald das Event onmousemove auftritt
$ = require("jquery")
_ = require("underscore")

main = require("../templates/main.html")
login = require("../templates/login.html")

mixOf = (base, mixins...) ->
  class Mixed extends base
  for mixin in mixins by -1 #earlier mixins override later ones
    for name, method of mixin::
      Mixed::[name] = method
  Mixed


user = {}
class Animal
	testConsoleAnimal: ->
		console.log "Animal Klasse"	
	animalsList: []
	name:null
	selectAnimal: (animal_name) ->
		@name = animal_name
		@animalsList.push animal_name

Tiger = new Animal()

Tiger.selectAnimal("White Tiger")
Tiger.selectAnimal("Lion")

addChainedAttributeAccessor = (obj, propertyAttr, attr) ->
	obj[attr] = (newValues...) ->
		if newValues.length == 0
			obj[propertyAttr][attr]
		else
			obj[propertyAttr][attr] = newValues[0]
			obj



class AnimalDetails
	testConsole: ->
		console.log "AnimalDetails Klasse"	
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


class AnimalWhole extends mixOf Animal, AnimalDetails
	testAnswer: ->
		@testConsole()
		@testConsoleAnimal()


console.log TigerDetails.animalinfo

console.log AnimalDetails.get_count()
console.log Tiger.name
console.log Animal::animalsList[0]

testSuperClass = new AnimalWhole()
testSuperClass.testAnswer()
#testSuperClass.testConsole()



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





