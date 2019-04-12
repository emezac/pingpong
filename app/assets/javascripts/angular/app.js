var app = angular.module('app', ['templates', 'ui.router', 'mgcrea.ngStrap']);

app.config(['$stateProvider', '$urlRouterProvider', '$locationProvider', function($stateProvider, $urlRouterProvider, $locationProvider) {
  $stateProvider
    .state('/', {
      url: '/',
      templateUrl: 'angular/templates/main/index.html',
      controller: 'MainController'
    })
    .state('/players', {
      url: '/players',
      templateUrl: 'angular/templates/players/index.html',
      controller: 'PlayersController',
    })
    .state('/player', {
      url: '/players/:playerId',
      templateUrl: 'angular/templates/players/show.html',
      controller: 'PlayerController'
    })
    .state('/history', {
      url: '/players/:playerId/histories/:historyId',
      templateUrl: 'angular/templates/histories/show.html',
      controller: 'HistoryController'
    });

  $urlRouterProvider.otherwise('/');
}]);
