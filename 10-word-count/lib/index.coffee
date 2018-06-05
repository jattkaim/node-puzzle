through2 = require 'through2'


module.exports = ->
  words = 0
  lines = 1

  transform = (chunk, encoding, cb) ->
    chunk = chunk.match(/\w+|"(?:\\"|[^"])+"/g);
    #tokens = chunk.split("  (?=(([^\"]*[\"]))*[^\"]*$)")
    #console.log(chunk)
    words = chunk.length
    return cb()

  flush = (cb) ->
    this.push {words, lines}
    this.push null
    return cb()

  return through2.obj transform, flush
