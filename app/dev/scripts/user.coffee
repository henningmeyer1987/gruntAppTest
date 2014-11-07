class User
	id: null
	name:null
	constructor:() ->

	set:(attribute_name, attribute_value) ->
		@[attribute_name] = attribute_value

	get:(attribute_name) ->
		@[attribute_name]

	save: ->
		localStorage.setItem "user", JSON.stringify @

	fetch: ->
		userString = localStorage.getItem("user")
		if userString?
			user = JSON.parse(userString)
			@id = user.id
			@name = user.name
			return true
		else
			return false
	destroy: ->
		localStorage.removeItem("user")
		@id = null
		@name = null

module.exports = new User()