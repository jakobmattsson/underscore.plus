
do ->
  getSelector = (s) -> if typeof s == 'string' then (e) -> e[s] else s

  exports.toMap = (array, key, value) ->

    keySelector = getSelector(key)
    valueSelector = getSelector(value) ? (e) -> e

    array.reduce (acc, e) ->
      acc[keySelector(e)] = valueSelector(e)
      acc
    , {}
