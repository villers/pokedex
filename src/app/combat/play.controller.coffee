angular.module "pokedex"
.controller "CombatPlayCtrl", ($scope, $localStorage, $routeParams, pokemonService) ->

  $scope.fight = []

  $scope.clearStorage = () ->
    $localStorage.teams = { a: [], b: []}
    $scope.teams = $localStorage.teams

  init = () ->
    $scope.teams = JSON.parse(JSON.stringify($localStorage.teams)) || { a: [], b: []}
    console.log $localStorage.teams
    $scope.teams.a.forEach (element, index, array) ->
      element.level = 5
      element.hpMax = element.hp

    $scope.teams.b.forEach (element, index, array) ->
      element.level = 5
      element.hpMax = element.hp

    $scope.fight.push($scope.teams.a.shift())
    $scope.fight.push($scope.teams.b.shift())

  init()

  console.log $scope



#show/name
