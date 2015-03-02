angular.module "pokedex"
  .factory "pokemonService", ($http, $q, $filter, $window) ->
    localStorage = $window.localStorage

    allPokemon : ->
      deferred = $q.defer()
      $http.get('pokedex.json', {cache: true}).success (data) ->
        deferred.resolve data
        return
      deferred.promise

    allType : ->
      deferred = $q.defer()
      $http.get('type.json', {cache: true}).success (data) ->
        deferred.resolve data
        return
      deferred.promise

    allMove : ->
      deferred = $q.defer()
      $http.get('move.json', {cache: true}).success (data) ->
        deferred.resolve data
        return
      deferred.promise

    byType : (type) ->
      deferred = $q.defer()
      @allPokemon().then (data) ->
        results = data.objects.filter((pokemon) ->
          pokemon.types.some (t) ->
            t.name == type
        )
        deferred.resolve results
        return
      deferred.promise

    byName : (name) ->
      deferred = $q.defer()
      @allPokemon().then (data) ->
        results = data.objects.filter((pokemon) ->
          pokemon.name == name
        )
        if results.length > 0
          deferred.resolve results[0]
        else
          deferred.reject()
        return
      deferred.promise

    getDescription : (url) ->
      deferred = $q.defer()
      $http.get('http://pokeapi.co/'+url, {cache: true}).success (data) ->
        deferred.resolve data
        return
      deferred.promise

    allMoveByName : (name) ->
      deferred = $q.defer()
      @allMove().then (data) ->
        results = data.objects.filter((move) ->
          move.name == name
        )
        if results.length > 0
          deferred.resolve results[0]
        else
          deferred.reject()
        return
      deferred.promise
