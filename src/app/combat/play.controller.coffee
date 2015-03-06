angular.module "pokedex"
.controller "CombatPlayCtrl", ($scope, $localStorage, $location, $routeParams, pokemonService) ->
  $scope.fight = []

  $scope.clearStorage = () ->
    $localStorage.$reset()
    $location.path("/")

  $scope.selectPokemon = (index) ->
    $scope.teams.a.forEach (element, index, array) ->
      element.selected = 0
    $scope.teams.a[index].selected = 1
    $scope.fight[0] = $scope.teams.a[index]

  $scope.atkEnemy = (move) ->
    if move.power isnt 0 and $scope.fight[0].hp > 0
      $scope.teams.b.forEach (element, index, array) ->
        if element.selected is 1
          degat = parseInt(((element.level * 0.4 + 2) * $scope.fight[0].attack * move.power) / (element.defense * 50) ) + 2
          if 0 >= element.hp - degat || element.hp <= 0
            element.hp = 0
          else
            element.hp = element.hp - degat
          console.log((element.level * 0.4 + 2),$scope.fight[0].attack, move.power, element.defense * 50 )
    if($scope.fight[1].hp > 0)
      atkAlly()
    checkLive()

  atkAlly = () ->
    $scope.teams.a.forEach (element, index, array) ->
      if element.selected is 1
        random = Math.floor(Math.random()*(element.moves.length - 1))
        move = element.moves[random]

        if move.power isnt 0
          degat = parseInt(((element.level * 0.4 + 2) * $scope.fight[1].attack * move.power) / (element.defense * 50) ) + 2
          if 0 >= element.hp - degat || element.hp <= 0
            element.hp = 0
          else
            element.hp = element.hp - degat
          #console.log(move.power, element.defense, degat)

  checkLive = () ->
    if $scope.teams.b.length > 0 && $scope.teams.b[0].hp is 0 && $scope.teams.b[0].selected is 1
      $scope.teams.b.shift()
      if $scope.teams.b.length > 0
        $scope.teams.b[0].selected = 1
        $scope.fight[1] = $scope.teams.b[0]
        console.log ($scope)

  if !$localStorage.teams
    $scope.clearStorage()
  else
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
    console.log $scope
