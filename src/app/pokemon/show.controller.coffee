angular.module "pokedex"
  .controller "ShowCtrl", ($scope, $routeParams, pokemonService) ->
    name = $routeParams.name
    $scope.description = []
    $scope.evolutions = []
    $scope.moves = []

    addEvolution = (name, level) ->
      pokemonService.byName(name).then (evo) ->
        if $scope.pokemon.name isnt evo.name
          evo["levelEvo"] = level
          $scope.evolutions.push(evo)
        evo.evolutions.forEach (element, index, array) ->
          addEvolution(element.to, element.level)

    if name
      pokemonService.byName(name).then (data) ->
        $scope.pokemon = data
        data.descriptions.forEach (element, index, array) ->
          pokemonService.getDescription(element.resource_uri).then (data) ->
            $scope.description.push(data)

        data.moves.forEach (element, index, array) ->
          pokemonService.allMoveByName(element.name).then (data) ->
            $scope.moves.push(data)

      addEvolution(name, 1)

    console.log $scope
