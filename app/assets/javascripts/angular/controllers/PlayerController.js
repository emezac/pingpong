var app = angular.module('app');

app.controller('PlayerController', ['$scope', '$stateParams', '$http', '$modal', 'Player', 'History',
  function($scope, $stateParams, $http, $modal, Player, History) {
  $scope.player = {};
  $scope.histories = [];
  $scope.history = {};
  $scope.new_history = {};
  $scope.history_statuses = {};
  $scope.historyId = null;
  $scope.query = null;

  $scope.addHistory = function() {
    createModal.$promise.then(createModal.show);
  };

  $scope.createHistory = function() {
    History.create($scope.player.id, $scope.new_history).then(function(response) {
      $scope.histories.push(response.data);
      $scope.new_history = {};
      createModal.hide();
    }, function(response) {
      alert('Something went wrong: ' + response.statusText + '. Code: ' + response.status);
    });
  };

  $scope.editHistory = function(history, index) {
    editModal.$promise.then(editModal.show);
    $scope.history = angular.copy(history);
    $scope.historyId = index;
  };

  $scope.updateHistory = function() {
    History.update($scope.player.id, $scope.history).then(function(response) {
      $scope.histories[$scope.historyId] = response.data;
      $scope.history = {};
      $scope.historyId = null;
      editModal.hide();
    }, function(response) {
      alert('Something went wrong: ' + response.statusText + '. Code: ' + response.status);
    });
  };

  $scope.destroyHistory = function(playerId, historyId, index) {
    History.destroy(playerId, historyId).then(function(response) {
      $scope.histories.splice(index, 1);
    }, function(response) {
      alert('Something went wrong: ' + response.statusText + '. Code: ' + response.status);
    });
  };

  $scope.filterHistorys = function(query) {
    if($scope.query != '') {
      History.search($scope.player.id, $scope.query).then(function(response) {
        $scope.histories = response.data;
      });
    } else {
      fetchPlayer();
    }
  };

  function fetchPlayer() {
    return Player.show($stateParams.playerId).then(function(response) {
      $scope.player = response.data.player;
      $scope.histories = response.data.histories;
      $scope.history_statuses = response.data.history_statuses;
    })
  };

  var createModal = $modal({
    scope: $scope,
    templateUrl: 'angular/templates/histories/addHistoryModal.html',
    show: false
  });

  var editModal = $modal({
    scope: $scope,
    templateUrl: 'angular/templates/histories/editHistoryModal.html',
    show: false
  });

  fetchPlayer();
}]);
