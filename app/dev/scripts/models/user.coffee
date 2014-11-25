Backbone = require("backbone")
BaseModel = require("./base.coffee")
class User extends BaseModel
	localStorage:new Backbone.LocalStorage('User')
	initialize:()->
		if @get("id") is null
			@set "id", localStorage.getItem("User")
			@set "name", localStorage.getItem("User")

	defaults:
		id: null
		name:null
module.exports = new User()