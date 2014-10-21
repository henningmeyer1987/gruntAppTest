// Generated by CoffeeScript 1.7.1
module.exports = function(grunt) {
  var plugin, _i, _len, _ref;
  grunt.initConfig({
    pkg: grunt.file.readJSON("package.json"),
    watch: {
      livereload: {
        files: ["app/**"],
        options: {
          livereload: true
        }
      }
    }
  });
  _ref = ["grunt-contrib-watch"];
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    plugin = _ref[_i];
    grunt.loadNpmTasks(plugin);
  }
  return grunt.registerTask("default", ["watch"]);
};