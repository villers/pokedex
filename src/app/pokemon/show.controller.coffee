angular.module "pokedex"
  .controller "ShowCtrl", ($scope, $routeParams, pokemonService) ->
    name = $routeParams.name
    $scope.description = []
    $scope.evolutions = []
    $scope.moves = []

    if name
      pokemonService.byName(name).then (data) ->
        $scope.pokemon = data
        $scope.pokemon.evolutions.forEach (element, index, array) ->
          pokemonService.byName(element.to).then (evo) ->
            evo["levelEvo"] = element.level
            $scope.evolutions.push(evo)

            $scope.evolutions.forEach (element, index, array) ->
              if(element.evolutions[0])
                pokemonService.byName(element.evolutions[0].to).then (evo) ->
                  evo["levelEvo"] = element.evolutions[0].level
                  $scope.evolutions.push(evo)

        $scope.pokemon.descriptions.forEach (element, index, array) ->
          pokemonService.getDescription(element.resource_uri).then (data) ->
            $scope.description.push(data)

        $scope.pokemon.moves.forEach (element, index, array) ->
          pokemonService.allMoveByName(element.name).then (data) ->
            $scope.moves.push(data)

    console.log $scope

