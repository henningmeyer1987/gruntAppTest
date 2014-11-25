$ = require("jquery")
_ = require("underscore")
BaseView = require("./base.coffee")
login_template = require("../../templates/login.html")
main_template = require("../../templates/main.html")
User = require("../models/user.coffee")

class LoginView extends BaseView
	el: "#app"
	login_template: login_template
	main_template: main_template
	events:
		"submit form": "submit_form"
		"click #delete-button":"logout"

	initialize:()->
		@listenTo User, "change", @show
		User.fetch()
		@show()

	show:()->
		if User.get("id") >= 1
			@render(@main_template)
			$("#username").html(User.get("name"))
			$("#user-id").html(User.get("id"))
		else
			@render(@login_template)

	submit_form:(event)->
		event.preventDefault()
		name = $("#username-input").val()
		User.set("id", _.uniqueId())
		User.set("name", name)
		User.save()
		console.log User

	logout:(event)->
		event.preventDefault()
		User.destroy()
		User.set("id", null)
		User.set("name", null)


module.exports = new LoginView()