_ = require 'underscore'

do ->
  getSelector = (s) -> if typeof s == 'string' then (e) -> e[s] else s

  exports.toObject = (array, key, value) ->

    keySelector = getSelector(key)
    valueSelector = getSelector(value) ? (e) -> e

    array.reduce (acc, e) ->
      acc[keySelector(e)] = valueSelector(e)
      acc
    , {}

exports.prepend = (target, e) ->
  if Array.isArray(target)
    [e].concat(target)
  else if typeof target == 'string'
    e + target
  else
    throw 'Must be string or array'

exports.append = (target, e) ->
  if Array.isArray(target)
    target.concat([e])
  else if typeof target == 'string'
    target + e
  else
    throw 'Must be string or array'

exports.zipToObject = (keys, values) ->
  exports.toObject(_.zip(keys, values), '0', '1')

exports.toKeyValues = (source) ->
  Object.keys(source).map (key) ->
    key: key
    value: source[key]

exports.makeObject = (args...) ->
  o = {}
  for i in [0...args.length] by 2
    o[args[i]] = args[i+1]
  o
