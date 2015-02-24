angular.module "pokedex"
  .controller "MainCtrl", ($scope, pokemonService) ->
    pokemonService.allPokemon().then (data) ->
      $scope.pokemons = data.objects
      return

    pokemonService.allType().then (data) ->
      $scope.types = data.objects
      return

    console.log $scope

