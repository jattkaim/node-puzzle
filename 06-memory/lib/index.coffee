fs = require 'fs'
readline =require 'readline'

##using readline to only read in a line at a time allowing less heap memory to be used
##on larger files.
exports.countryIpCounter = (countryCode, cb) ->
  return cb() unless countryCode
  #create a readstream
  rl = readline.createInterface(fs.createReadStream("#{__dirname}/../data/geo.txt"))
  counter =0
  #on each line check if matches countrycode and do maths on counter
  rl.on 'line', (input) ->
    line = input.split '\t'
    #console.log(line)
    if line[3] == countryCode then counter += +line[1] - +line[0]


  rl.on 'close', () ->
    #console.log "test: "+n
    cb null,counter
