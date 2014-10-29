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
					cwd:'app/dev/scripts'
					src:['*.coffee']
					dest:'app/build/js'
					ext: '.js'
				]
		copy: 
			main:
				expand:true
				cwd: 'app/dev/'
				src: '*.html'
				dest:'app/build'
			css:
				expand:true
				cwd: 'app/dev/stylesheets'
				src: '*.css'
				dest:'app/build/css'
			vendor:
				expand:true
				cwd: 'app/dev/vendor/jquery/dist'
				src:'jquery.min.js'
				dest:'app/build/vendor/jquery'				


	for plugin in [
			"grunt-contrib-watch"
			"grunt-contrib-coffee"
			"grunt-contrib-copy"
	]
			grunt.loadNpmTasks plugin


	grunt.registerTask "default", ["coffee", "copy","watch"]