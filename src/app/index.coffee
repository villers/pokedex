angular.module "pokedex", ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngRoute', 'ngMaterial', 'ngMessages', 'angular-loading-bar']
  .config ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "app/main/main.html"
        controller: "MainCtrl"
      .when "/type/:type",
        templateUrl: "app/main/main.html"
        controller: "MainCtrl"
      .when "/pokemon/:name",
        templateUrl: "app/pokemon/show.html"
        controller: "ShowCtrl"
      .otherwise
        redirectTo: "/"
