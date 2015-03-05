angular.module "pokedex"
.controller "CombatPlayCtrl", ($scope, $localStorage, $routeParams, pokemonService) ->
  $scope.fight = []

  $scope.clearStorage = () ->
    $localStorage.teams = { a: [], b: []}
    $scope.teams = $localStorage.teams

  $scope.selectPokemon = (index) ->
    $scope.teams.a.forEach (element, index, array) ->
      element.selected = 0
    $scope.teams.a[index].selected = 1
    $scope.fight[0] = $scope.teams.a[index]

  init = () ->
    $scope.teams = JSON.parse(JSON.stringify($localStorage.teams)) || { a: [], b: []}
    $scope.teams.a.forEach (element, index, array) ->
      if index is 0
        element.selected = 1
      else
        element.selected = 0
      element.level = 5
      element.hpMax = element.hp

      element.moves.forEach (element2, index2, array) ->
        pokemonService.allMoveByName(element2.name).then (data) ->
          $scope.teams.a[index].moves[index2] = data

    $scope.teams.b.forEach (element, index, array) ->
      if index is 0
        element.selected = 1
      else
        element.selected = 0
      element.level = 5
      element.hpMax = element.hp

      element.moves.forEach (element2, index2, array) ->
        pokemonService.allMoveByName(element2.name).then (data) ->
          $scope.teams.b[index].moves[index2] = data

    $scope.fight = [
      $scope.teams.a[0]
      $scope.teams.b[0]
    ]
  init()

  console.log $scope
