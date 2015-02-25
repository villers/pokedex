angular.module "pokedex"
  .controller "MainCtrl", ($scope, $routeParams, pokemonService) ->
    type = $routeParams.type

    if type
      pokemonService.byType(type).then (data) ->
        $scope.pokemons = data
        return

    else

      pokemonService.allPokemon().then (data) ->
        $scope.pokemons = data.objects
        return

      #pokemonService.allType().then (data) ->
      #  $scope.types = data.objects
      #  return

    console.log $scope
