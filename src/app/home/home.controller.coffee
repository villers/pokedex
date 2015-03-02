angular.module "pokedex"
.controller "HomeCtrl", ($scope, $routeParams, pokemonService) ->
  type = $routeParams.type
  currentIndex = 0
  dataPokemon = []
  $scope.pokemons = []

  $scope.teams =
    a: []
    b: []

  sortPokemon = () ->
    dataPokemon.sort (a, b) ->
      a.pkdx_id - b.pkdx_id

  $scope.addPokemonTeamA = (name) ->
    pokemonService.byName(name).then (data) ->
      $scope.teams.a.push(data)

  $scope.loadAll = () ->
    if dataPokemon.length isnt currentIndex
      $scope.pokemons = dataPokemon
      currentIndex = dataPokemon.length

  $scope.addMore = () ->
    tmpIndex = currentIndex
    if dataPokemon.length is currentIndex
      return
    tmpIndex = if dataPokemon.length < currentIndex + 10 then dataPokemon.length else currentIndex + 10
    $scope.pokemons = $scope.pokemons.concat dataPokemon.slice(currentIndex, tmpIndex)
    currentIndex = tmpIndex

  if type
    pokemonService.byType(type).then (data) ->
      dataPokemon = data
      sortPokemon()
      $scope.addMore()
  else
    pokemonService.allPokemon().then (data) ->
      dataPokemon = data.objects
      sortPokemon()
      $scope.addMore()

  #pokemonService.allType().then (data) ->
  #  $scope.types = data.objects
  #  return

  console.log $scope



#show/name
