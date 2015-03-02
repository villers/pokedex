angular.module "pokedex", [
    'ngAnimate'
    'ngCookies'
    'ngStorage'
    'ngTouch'
    'ngSanitize'
    'ngRoute'
    'ngMaterial'
    'ngMessages'
    'angular-loading-bar'
    'infinite-scroll'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when "/",
        templateUrl: "app/home/home.html"
        controller: "HomeCtrl"

      .when "/type/:type",
        templateUrl: "app/home/home.html"
        controller: "HomeCtrl"

      .when "/pokemon/:name",
        templateUrl: "app/pokemon/show.html"
        controller: "ShowCtrl"

      .when "/add",
        templateUrl: "app/form/add.html"
        controller: "FormAddCtrl"

      .otherwise
        redirectTo: "/"
