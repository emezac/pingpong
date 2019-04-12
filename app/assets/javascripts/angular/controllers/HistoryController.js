var app = angular.module('app');

app.controller('HistoryController', ['$scope', '$stateParams', '$http', 'History', function($scope, $stateParams, $http, History) {
  $scope.history = {};

  function fetchHistory() {
    return History.show($stateParams.playerId, $stateParams.historyId).then(function(response) {
      $scope.history = response.data;
    })
  };

  fetchHistory();
}]);
