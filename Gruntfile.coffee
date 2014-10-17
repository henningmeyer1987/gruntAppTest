module.exports = (grunt) ->

	grunt.initConfig
		pkg: grunt.file.readJSON("package.json")


		watch:
			livereload:
				files: ["app/**"]
				options:
					livereload: true

	for plugin in ["grunt-contrib-watch"]
		grunt.loadNpmTasks plugin

	grunt.registerTask "default", ["watch"]