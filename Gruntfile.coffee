module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON("package.json")

		watch:
			livereload:
				files: ["app/**"]
				options:
					livereload: true
			coffee:
				files:["app/dev/coffee/*.coffee"]
				tasks:["coffee:dist"]
				options:
					spawm:false

		coffee:
			dist:
				files: [
					expand:true
					flatten:true
					cwd:'app/dev/coffee'
					src:['*.coffee']
					dest:'app/build/js'
					ext: '.js'
				]

	for plugin in [
			"grunt-contrib-watch"
			"grunt-contrib-coffee"
	]
			grunt.loadNpmTasks plugin


	grunt.registerTask "default", ["watch", "coffee"]