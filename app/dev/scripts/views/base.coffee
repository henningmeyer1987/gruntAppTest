$ = require("jquery")
Backbone = require("backbone")
Backbone.$ = $

class BaseView extends Backbone.View
	render:(template)->
		$(@el).html(template)

module.exports = BaseView