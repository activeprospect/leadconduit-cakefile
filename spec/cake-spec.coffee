assert = require('chai').assert
cake = require('../src/cake')

describe 'Cakefile', ->

  before ->
    # `cake` invocation would provide this function as a global
    global.option = () -> {}


  it 'should have tasks', ->

    tasks = []

    cake (name) ->
      tasks.push name

    assert.isTrue tasks.length >= 4
    assert.include tasks, 'build'
    assert.include tasks, 'test'
