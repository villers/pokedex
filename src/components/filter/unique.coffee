angular.module "pokedex"
  .filter 'unique', ->
    (collection, keyname) ->
      output = []
      keys = []
      angular.forEach collection, (item) ->
        key = item[keyname]
        if keys.indexOf(key) == -1
          keys.push key
          output.push item
        return
      output
