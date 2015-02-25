angular.module "pokedex"
  .controller "ShowCtrl", ($scope, $routeParams, pokemonService) ->
    name = $routeParams.name
    $scope.description = []

    if name
      pokemonService.byName(name).then (data) ->
        $scope.pokemon = data
        $scope.pokemon.descriptions.forEach (element, index, array) ->
          pokemonService.getDescription(element.resource_uri).then (data) ->
            $scope.description[index] = data
            return
        return

    console.log $scope

