class CounterCache

  constructor: ->
    @cache = {}

  flushTo: (queue) ->
    for key, value of @cache
      [name, source, measure_time] = key.split ';'
      
      obj = {name, value}
      obj.source = source if source?
      obj.measure_time = measure_time if measure_time?
      queue.push obj

  increment: (name, value=1) ->
    @cache[name] ?= 0
    @cache[name] += value


module.exports = CounterCache
