var app = angular.module('app');

app.controller('PlayersController', ['$scope', '$modal', 'Player', function($scope, $modal, Player) {
  $scope.players = [];
  $scope.new_player = {};
  $scope.player = {};
  $scope.playerId = null;
  $scope.query = null;

  function fetchPlayers() {
    return Player.index().then(function(response) {
      $scope.players = response.data;
    });
  };

  $scope.addPlayer = function() {
    createModal.$promise.then(createModal.show);
  };

  $scope.createPlayer = function() {
    Player.create($scope.new_player).then(function(response) {
      $scope.players.push(response.data.player);
      $scope.new_player = {};
      createModal.hide();
    }, function(response) {
      alert('Something went wrong: ' + response.statusText + '. Code: ' + response.status);
    });
  };

  $scope.editPlayer = function(player, playerId) {
    editModal.$promise.then(editModal.show);
    $scope.player = angular.copy(player);
    $scope.playerId = playerId;
  };

  $scope.updatePlayer = function() {
    Player.update($scope.player).then(function(response) {
      $scope.players[$scope.playerId] = response.data.player;
      $scope.player = {};
      $scope.playerId = null;
      editModal.hide();
    }, function(response) {
      alert('Something went wrong: ' + response.statusText + '. Code: ' + response.status);
    });
  };

  $scope.destroyPlayer = function(playerId, index) {
    Player.destroy(playerId).then(function(response) {
      $scope.players.splice(index, 1);
    }, function(response) {
      alert('Something went wrong: ' + response.statusText + '. Code: ' + response.status);
    });
  };

  $scope.filterPlayers = function() {
    if($scope.query != '') {
      Player.search($scope.query).then(function(response) {
        $scope.players = response.data;
      });
    } else {
      fetchPlayers();
    }
  };

  var createModal = $modal({
    scope: $scope,
    templateUrl: 'angular/templates/players/addPlayerModal.html',
    show: false
  });

  var editModal = $modal({
    scope: $scope,
    templateUrl: 'angular/templates/players/editPlayerModal.html',
    show: false
  });

  fetchPlayers();
}]);
