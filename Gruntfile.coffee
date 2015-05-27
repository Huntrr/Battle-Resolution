module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    config: grunt.file.readJSON 'config.json'
    coffeelint:
      options:
        max_line_length:
          level: 'ignore'
      lint:
        files:
          src: [
            '<%= config.dir.app.source %>/js/**/*.coffee'
            'GruntFile.coffee'
          ]
    browserify:
      dist:
        files:
          '<%= config.dir.app.dest %>/js/script.js': ['<%= config.dir.app.source %>/js/**/*.js', '<%= config.dir.app.source %>/js/**/*.coffee']
        options:
          transform: ['coffeeify']
          plugin: [
            [
              'remapify',
              [
                {
                  src: "**/*.coffee",
                  cwd: "./src/js/moves"
                  expose: "moves",
                },
                {
                  src: "**/*.coffee",
                  cwd: "./src/js/debaters"
                  expose: "debaters"
                },
                {
                  src: "**/*.coffee",
                  cwd: "./src/js/effects"
                  expose: "effects"
                },
                {
                  src: "**/*.*",
                  cwd: "./src/js/lib"
                  expose: "lib"
                }
              ]
            ]
          ]
    copy:
      main:
        files: [
          expand: true
          cwd: "<%= config.dir.app.source %>/"
          src: ["**/*.js", "**/*.css", "**/*.html", "img/**/*", "**/*.xml", "lib/**/*"]
          dest: "<%= config.dir.app.dest %>/"
        ]
    uglify:
      options:
        mangle: false
      compress:
        files: [
          expand: true
          cwd: "<%= config.dir.app.dest %>/"
          src: ["js/**/*.js"]
          dest: "<%= config.dir.app.dest %>/"
          extDot: 'first'
          ext: '.min.js'
        ]
    stylus:
      compile:
        options:
          use: [require 'nib']
          import: ['nib']
        files: [
          expand: true
          cwd: "<%= config.dir.app.source %>/"
          src: ["css/**/*.styl"]
          dest: "<%= config.dir.app.dest %>/"
          ext: ".css"
        ]
    jade:
      compile:
        options:
          data:
            debug: true
            timestamp: "<%= new Date().getTime() %>"
        files: [
          expand: true
          cwd: "<%= config.dir.app.source %>/"
          src: ["**/*.jade"]
          dest: "<%= config.dir.app.dest %>/"
          ext: ".html"
        ]
    clean:
      build:
        src: ["<%= config.dir.app.dest %>"]
    watch:
      options:
        livereload: 'true'
      browerify:
        files: ['<%= config.dir.app.source %>/js/**/*.coffee']
        tasks: [
          'newer:coffeelint:lint'
          'newer:browserify:dist'
        ]
      stylus:
        files: ['<%= config.dir.app.source %>/css/**/*.styl']
        tasks: ['newer:stylus:compile']
      jade:
        files: ['<%= config.dir.app.source %>/**/*.jade']
        tasks: ['newer:jade:compile']

  # load all grunt tasks matching the `grunt-*` pattern
  require('load-grunt-tasks') grunt

  grunt.registerTask "build", [
    "clean"
    "coffeelint"
    "browserify"
    "copy"
    "jade"
    "stylus"
  ]

  grunt.registerTask 'dev', [
    'watch'
  ]

  grunt.registerTask 'production', [
    'build'
    'uglify'
  ]

  grunt.registerTask 'default', [
    'build'
    'dev'
  ]


  grunt.registerTask 'check', 'connect:alive'
