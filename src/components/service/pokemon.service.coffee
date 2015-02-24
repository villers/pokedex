angular.module "pokedex"
  .factory "pokemonService", ($http, $q, $filter, $window) ->
    localStorage = $window.localStorage

    allPokemon : ->
      deferred = $q.defer()
      $http.get('pokedex.json').success (data) ->
        deferred.resolve data
        return
      deferred.promise

    allType : ->
      deferred = $q.defer()
      $http.get('type.json').success (data) ->
        deferred.resolve data
        return
      deferred.promise
