Backbone = require("backbone")
BaseModel = require("./base.coffee")

class User extends BaseModel
	localStorage:new Backbone.LocalStorage('User')
	initialize:()->
		
		@set "id", localStorage.getItem("User")
		@set "name", localStorage.getItem("User")
		###@setUserAttribute("id")
		@get "id", localStorage.getItem("User")
		@set "name", localStorage.getItem("User")
		console.log @get("name")###
		#if @get("id") >= 1
			
			
	setUserAttribute:(variable)->
		blablub = find("User-4")
		console.log blablub
		alert blablub


	defaults:
		id: null
		name:null
module.exports = new User()